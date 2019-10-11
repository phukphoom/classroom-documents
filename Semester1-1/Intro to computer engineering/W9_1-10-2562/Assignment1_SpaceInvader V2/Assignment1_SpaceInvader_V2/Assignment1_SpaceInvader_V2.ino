#include"LedControl.h"
#include"FontLEDClock.h"

#define CS_PIN     10
#define CLK_PIN    13
#define DIN_PIN    11
#define LED_MODULE 4

#define JoyA       2 //A
#define JoyB       3 //B
#define JoyC       4 //C
#define JoyD       5 //D
#define JoyBack    6 //E
#define JoyStart   7 //F
#define AnalogPush 8     
//-------------------------------------------------------------------------- Variable Define -------
typedef struct Ship{                  // โครงสร้างของยาน
  int x;
  int y;
  int HP = 8;
}Ship;
typedef struct Bullet{                // โครงสร้างของกระสุน
  bool status = false;
  int x = 999;
  int y = 999;
}Bullet;

LedControl lc = LedControl(DIN_PIN ,CLK_PIN ,CS_PIN ,LED_MODULE);
unsigned long delaytime = 100;        // ระยะเวลาในหยุดหน้าจอก่อนจะอัพเดตใหม่

const int player_maxbullet = 5;       // จำนวนกระสุนสูงสุดของผู้เล่น
int player_orderbullet = 0;           

const int enemy_maxbullet = 5;        // จำนวนกระสุนสูงสุดของศัตรู
int enemy_orderbullet = 0;

Ship player_ship;
Ship enemy_ship;
Bullet player_bullet[player_maxbullet];
Bullet enemy_bullet[enemy_maxbullet];
//-------------------------------------------------------------------------- Variable Define -------
//-------------------------------------------------------------------------- Main ------------------
void setup (){
  pinMode(JoyA,INPUT);              
  pinMode(JoyB,INPUT);
  pinMode(JoyC,INPUT);
  pinMode(JoyD,INPUT);
  pinMode(JoyBack,INPUT);
  pinMode(JoyStart,INPUT);
  pinMode(AnalogPush,INPUT);
  Serial.begin(9600);
  randomSeed(analogRead(4));
  
  led_init();                         // Led setup
  game_init();                        // Game setup
  
  player_ship.x = 3;                  // กำหนดพิกัด x เริ่มต้นของ player_ship
  player_ship.y = 31;                 // กำหนดพิกัด y เริ่มต้นของ player_ship
  enemy_ship.x = 3;                   // กำหนดพิกัด x เริ่มต้นของ enemy_ship
  enemy_ship.y = 8;                   // กำหนดพิกัด y เริ่มต้นของ enemy_ship
}
void loop(){
  //-------------------------------- Check order bullet -------------------
  player_orderbullet = check_order(1); // หา index ของ player_bullet[].status ว่าที่ index ไหนยังเป็น false อยู่ (ยังไม่ถูกยิงออกไป)
  enemy_orderbullet = check_order(2);  // หา index ของ enemy_bullet[].status ว่าที่ index ไหนยังเป็น false อยู่ (ยังไม่ถูกยิงออกไป)
  //-------------------------------- enemy movement -----------------------
  int enemy_movement = random(1,5);    // สุ่มการเคลื่อนที่ของยานศัตรู โดยสุ่มค่าตั้งเเต่ 1-5 โดย [1 move left [25%],2-3 not move[50%],4 move right [25%]]
  if(enemy_movement == 1){
    if(!overframe(enemy_ship.x-1,enemy_ship.y)){
      enemy_ship.x--;
    }
  }
  else if(enemy_movement == 4){
    if(!overframe(enemy_ship.x+1,enemy_ship.y)){
      enemy_ship.x++;
    }
  }
  if(enemy_orderbullet!=-1 && enemy_bullet[enemy_orderbullet].status==false){     // เช็คสถานะของกระสุนที่ index : enemy_orderbullet ว่ามีสถานะเป็น false(ยังไม่ถูกยิง) หรือไม่ 
    if(random(0,101)>=70){             // สุ่มการยิงกระสุนของยานศัตรู ซึ่งมีโอกาส 30% ที่จะยิงออกไป
      enemy_bullet[enemy_orderbullet].status = true;
      enemy_bullet[enemy_orderbullet].x = enemy_ship.x;
      enemy_bullet[enemy_orderbullet].y = enemy_ship.y+1;
    }
  }
  //-------------------------------- player movement ----------------------
  if(analogRead(0)<300){                // ควบคุมยานไปทางซ้ายผ่านเเกน analog
    if(!overframe(player_ship.x-1,player_ship.y)){
      player_ship.x--;
    }
  }
  else if(analogRead(0)>700){           // ควบคุมยานไปทางขวาผ่านเเกน analog
    if(!overframe(player_ship.x+1,player_ship.y)){
      player_ship.x++;
    }
  }
  /*if(analogRead(1)>700){                // ควบคุมยานไปด้านล่างผ่านเเกน analog
    if(!overframe(player_ship.x,player_ship.y-1)){
      player_ship.y--;
    }
  }
  else if(analogRead(1)<300){           // ควบคุมยานไปด้านบนผ่านเเกน analog
    if(!overframe(player_ship.x,player_ship.y+1)){
      player_ship.y++;
    }
  }*/
  if(digitalRead(JoyC)==LOW){           // ควบคุมการยิงกระสุนผ่านปุ่ม C บนจอยสติ๊ก
    if(player_orderbullet!=-1 && player_bullet[player_orderbullet].status==false){  // เช็คสถานะของกระสุนที่ index : player_orderbullet ว่ามีสถานะเป็น false(ยังไม่ถูกยิง) หรือไม่ 
      player_bullet[player_orderbullet].status = true;
      player_bullet[player_orderbullet].x = player_ship.x;
      player_bullet[player_orderbullet].y = player_ship.y-1;
    }
  }
  //-------------------------------- Checking ------------------------------- 
  check_bullet_hit();                   // เช็คการชนกันของ กระสุนผู้เล่น กับ กระสุนศัตรู
  check_player_dmg();                   // เช็คการได้รับดาเมจของยานผู้เล่น
  check_enemy_dmg();                    // เช็คการได้รับดาเมจของยานศัตรู
  //-------------------------------- Drawing --------------------------------
  draw_player_ship(player_ship.x,player_ship.y);    // วาดยานผู้เล่นลงบน led_dotmatrix
  draw_enemy_ship(enemy_ship.x,enemy_ship.y);       // วาดยานศัตรูลงบน led_dotmatrix
  for(int i=0;i<player_maxbullet;i++){              // วาดกระสุนของผู้เล่นลงบน led_dotmatrix
    if(player_bullet[i].status==true){
      draw_bullet(player_bullet[i].x,player_bullet[i].y);
    }
  }
  for(int i=0;i<enemy_maxbullet;i++){               // วาดกระสุนของศัตรูลงบน led_dotmatrix
    if(enemy_bullet[i].status==true){
      draw_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
    }
  }
  //-------------------------------- Delay ----------------------------------
  delay(delaytime);                                 // Delay หน้าจอ
  //-------------------------------- Erasing --------------------------------
  erase_player_ship(player_ship.x,player_ship.y);   // ลบยานผู้เล่นบน led_dotmatrix
  erase_enemy_ship(enemy_ship.x,enemy_ship.y);      // ลบยานศัตรูบน led_dotmatrix
  for(int i=0;i<player_maxbullet;i++){              // ลบกระสุนของผู้เล่นบน led_dotmatrix
    if(player_bullet[i].status==true){
      erase_bullet(player_bullet[i].x,player_bullet[i].y);
      player_bullet[i].y--;
      if(overframe(player_bullet[i].x,player_bullet[i].y)){ // เช็คกระสุนของผู้เล่น ว่าออกนอกขอบเขตจอหรือไม่ ถ้าเกินให้ status กลับเป็น false (ยังไม่ถูกยิง)
        player_bullet[i].status = false;
        player_bullet[i].x = 999;
        player_bullet[i].y = 999;
      }
    }
  }
  for(int i=0;i<enemy_maxbullet;i++){               // ลบกระสุนของผู้เล่นบน led_dotmatrix
    if(enemy_bullet[i].status==true){
      erase_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
      enemy_bullet[i].y++;
      if(overframe(enemy_bullet[i].x,enemy_bullet[i].y)){  // เช็คกระสุนของศัตรู ว่าออกนอกขอบเขตจอหรือไม่ ถ้าเกินให้ status กลับเป็น false (ยังไม่ถูกยิง)
        enemy_bullet[i].status = false;
        enemy_bullet[i].x = 999;
        enemy_bullet[i].y = 999;
      }
    }
  }
  //-------------------------------- Game Ending -----------------------------
  if(player_ship.HP<=0){                            // เช็ค HP ผู้เล่นน้อยกว่าเท่ากับ 0 หรือไม่ [ถ้าจริง ให้จบเกมเเละเเสดงหน้าจอ เเพ้]
    endscreen();
    for(int i=0;i<3;i++){
      clear_display();
      delay(100);
      losescreen();
      delay(500);   
    }
    delay(100000);
  }
  else if(enemy_ship.HP<=0){                        // เช็ค HP ศัตรูน้อยกว่าเท่ากับ 0 หรือไม่ [ถ้าจริง ให้จบเกมเเละเเสดงหน้าจอ ชนะ]
    endscreen();
    for(int i=0;i<3;i++){
      clear_display();
      delay(100);
      winscreen();
      delay(500);
    }
    delay(100000);
  }
}
//-------------------------------------------------------------------------- Main ------------------
//-------------------------------------------------------------------------- Function --------------
//---------------------------------- Initialize ------------------------------
void led_init(){                        // ฟังก์ชัน setup Led_dotmatrix
  int devices = lc.getDeviceCount(); //find number of devices
  for(int address=0;address<devices;address++){
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}
void game_init(){                       // ฟังก์ชัน เเสดงหน้าจอเริ่มต้นเกม
  for(int y=0;y<32;y++){
    for(int x=0;x<8;x++){
      plot(x,y);
      delay(10);
    }
  }
  clear_display();
  for(int x=0;x<8;x++){
    plot(x,0);
  }
  for(int x=0;x<8;x++){
    plot(x,2);
  }
  for(int x=0;x<8;x++){
    plot(x,6);
  }
  for(int x=0;x<8;x++){
    plot(x,7);
  }
}
//---------------------------------- Graphics --------------------------------
void plot(int x,int y){                 // ฟังก์ชัน เเสดงจุดบน Led_dotmatrix โดยใช้พิกัด x,y
  int address;
  int col = y%8;
  int row = 7-x;
  if(y<8){
    address = 3;
  }
  else if(y<16){
    address = 2;
  }
  else if(y<24){
    address = 1;
  }
  else if(y<32){
    address = 0;
  }
  lc.setLed(address,row,col,true);
}
void delete_plot(int x,int y){          // ฟังก์ชัน ลบจุดบน Led_dotmatrix โดยใช้พิกัด x,y
  int address;
  int col = y%8;
  int row = 7-x;
  if(y<8){
    address = 3;
  }
  else if(y<16){
    address = 2;
  }
  else if(y<24){
    address = 1;
  }
  else if(y<32){
    address = 0;
  }
  lc.setLed(address,row,col,false);
}
void clear_display(){                   // ฟังก์ชัน ล้างหน้าจอ Led_dotmatrix ทั้งหมด (ทุกหน้าจอ)
  int devices = lc.getDeviceCount();
  for(int address=0;address<devices;address++){
    lc.clearDisplay(address);
  }
}
//---------------------------------- Game system ------------------------------
void draw_player_ship(int x,int y){     // ฟังก์ชัน วาดยานยานผู้เล่น ลงบนหน้าจอ Led_dotmatrix
  plot(x-1,y); 
  plot(x,y);   
  plot(x+1,y);
  plot(x,y-1);
}
void draw_enemy_ship(int x,int y){      // ฟังก์ชัน วาดยานยานศัตรู ลงบนหน้าจอ Led_dotmatrix
  plot(x-1,y); 
  plot(x,y);   
  plot(x+1,y);
  plot(x,y+1);
}
void draw_bullet(int x,int y){          // ฟังก์ชัน วาดกระสุน ลงบนหน้าจอ Led_dotmatrix
  plot(x,y);
}

void erase_player_ship(int x,int y){    // ฟังก์ชัน ลบยานยานผู้เล่น ลงบนหน้าจอ Led_dotmatrix
  delete_plot(x-1,y); 
  delete_plot(x,y);   
  delete_plot(x+1,y);
  delete_plot(x,y-1);
}
void erase_enemy_ship(int x,int y){     // ฟังก์ชัน ลบยานยานศัตรู ลงบนหน้าจอ Led_dotmatrix
  delete_plot(x-1,y); 
  delete_plot(x,y);   
  delete_plot(x+1,y);
  delete_plot(x,y+1);
}
void erase_bullet(int x ,int y){        // ฟังก์ชัน ลบกระสุน ลงบนหน้าจอ Led_dotmatrix
  delete_plot(x,y);
}

bool overframe(int x ,int y){           // ฟังก์ชัน เช็คว่า (x,y) ที่ส่งเข้ามา อยู่เกินขอบเขตจอ Led_dotmatrix หรือไม่
  if(x>=0 && x<8 && y>=8 && y<32){
    return false;
  }
  else{
    return true;
  }
}

int check_order(int option){             // ฟังก์ชัน หา index ของสถานะกระสุน ว่าที่ index ไหนยังเป็น false อยู่ (ยังไม่ถูกยิงออกไป)
  if(option==1){                                  // โดย option = 1 จะหาที่ player_bullet[]
    for(int i=0;i<player_maxbullet;i++){
      if(player_bullet[i].status==false){
        return i;
      }
    }
    return -1;
  }
  if(option==2){                                  // โดย option = 2 จะหาที่ enemy_bullet[]
    for(int i=0;i<enemy_maxbullet;i++){
      if(enemy_bullet[i].status==false){
        return i;
      }
    }
    return -1;
  }
}
void check_bullet_hit(){                 // ฟังก์ชัน เช็คการชนกันของกระสุนผู้เล่น เเละกระสุนศัตรู
  for(int i=0;i<player_maxbullet;i++){
      for(int j=0;j<enemy_maxbullet;j++){
          if(player_bullet[i].x==enemy_bullet[j].x && player_bullet[i].y<=enemy_bullet[j].y){
              if(player_bullet[i].status==true && enemy_bullet[j].status==true){
                erase_bullet(player_bullet[i].x,player_bullet[i].y);
                erase_bullet(enemy_bullet[j].x,enemy_bullet[j].y);

                player_bullet[i].status = false;
                player_bullet[i].x = 999;
                player_bullet[i].y = 999;
                enemy_bullet[j].status = false;
                enemy_bullet[j].x = 999;
                enemy_bullet[j].y = 999;
              }
          }
      }
  }
}
void check_player_dmg(){                // ฟังก์ชัน เช็คการชนกันของกระสุนศัตรู เเละยานของผู้เล่น
  for(int i=0;i<enemy_maxbullet;i++){
    if((enemy_bullet[i].x==player_ship.x && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x-1 && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x+1 && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x && enemy_bullet[i].y==player_ship.y-1)){
      if(enemy_bullet[i].status==true){
        player_ship.HP--;                         // มีการลด HP ของยานผู้เล่น
        decrease_player_HP();                     // เปลี่ยนเเปลง HP ของผู้เล่นที่เเสดงบน Led_dotmatrix (ลบหลอดเลือดบนจอไป 1 ช่อง)
        erase_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
        enemy_bullet[i].status = false;
        enemy_bullet[i].x = 999;
        enemy_bullet[i].y = 999;
      }
    } 
  }
}
void check_enemy_dmg(){                 // ฟังก์ชัน เช็คการชนกันของกระสุนผู้เล่น เเละยานของศัตรู
  for(int i=0;i<player_maxbullet;i++){
    if((player_bullet[i].x==enemy_ship.x && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x-1 && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x+1 && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x && player_bullet[i].y==enemy_ship.y+1)){
      if(player_bullet[i].status==true){
        enemy_ship.HP--;                          // มีการลด HP ของยานผู้เล่น
        decrease_enemy_HP();                      // เปลี่ยนเเปลง HP ของศัตรูที่เเสดงบน Led_dotmatrix (ลบหลอดเลือดบนจอไป 1 ช่อง)
        erase_bullet(player_bullet[i].x,player_bullet[i].y);
        player_bullet[i].status = false;
        player_bullet[i].x = 999;
        player_bullet[i].y = 999;
      }
    } 
  }
}

void decrease_player_HP(){              //ฟังก์ชัน ลด HP ของผู้เล่นที่เเสดงบน Led_dotmatrix (ลบหลอดเลือดบนจอไป 1 ช่อง)
  delete_plot(player_ship.HP,0);
}
void decrease_enemy_HP(){
  delete_plot(enemy_ship.HP,2);         //ฟังก์ชัน ลด HP ของศัตรูที่เเสดงบน Led_dotmatrix (ลบหลอดเลือดบนจอไป 1 ช่อง)
}

void endscreen(){                       //ฟังก์ชัน เเสดงหน้าจอจบเกม
  clear_display();
  for(int x=0;x<8;x++){
    for(int y=0;y<32;y++){
      plot(x,y);
      delay(1);
    }
  }
  for(int x=7;x>=0;x--){
    for(int y=31;y>=0;y--){
      delete_plot(x,y);
      delay(1);
    }
  }
}
void winscreen(){                       //ฟังก์ชัน เเสดงหน้าจอ ชนะ
  int address;
  int col;
  
  address = 3;
  col=1;
  for(int i=0;i<5;i++){  // L
    lc.setColumn(address,col,myfont[23][i]); 
    col++;
  }

  address = 2;
  col=1;
  for(int i=0;i<5;i++){  // O
    lc.setColumn(address,col,myfont[9][i]); 
    col++;
  }

  address = 1;
  col=1;
  for(int i=0;i<5;i++){  // S
    lc.setColumn(address,col,myfont[14][i]); 
    col++;
  }
}
void losescreen(){                       //ฟังก์ชัน เเสดงหน้าจอ แพ้
  int address;
  int col;
  
  address = 3;
  col=1;
  for(int i=0;i<5;i++){  // L
    lc.setColumn(address,col,myfont[12][i]); 
    col++;
  }

  address = 2;
  col=1;
  for(int i=0;i<5;i++){  // O
    lc.setColumn(address,col,myfont[15][i]); 
    col++;
  }

  address = 1;
  col=1;
  for(int i=0;i<5;i++){  // S
    lc.setColumn(address,col,myfont[19][i]); 
    col++;
  }

  address = 0;
  col=1;
  for(int i=0;i<5;i++){  // E
    lc.setColumn(address,col,myfont[5][i]); 
    col++;
  }
}
//---------------------------------- showdebuglog -----------------------------
void showdebuglog(){
  Serial.print("player_HP :");
  Serial.print(player_ship.HP);
  Serial.print("\tenemy_HP :");
  Serial.print(enemy_ship.HP);
  
  Serial.print("\t||\tplayer_bullet..status :");
  for(int i=0;i<player_maxbullet;i++){
    Serial.print(player_bullet[i].status); 
    Serial.print(" ");
  }
  Serial.print("\tplayer_order :");
  Serial.print(player_orderbullet);
  Serial.print(" | ");
  for(int i=0;i<player_maxbullet;i++){
    Serial.print(player_bullet[i].x);
    Serial.print(",");
    Serial.print(player_bullet[i].y);
    Serial.print("  ");
  }
  
  Serial.print("\t||\tenemy_bullet..status :");
  for(int i=0;i<enemy_maxbullet;i++){
    Serial.print(enemy_bullet[i].status); 
    Serial.print(" ");
  }
  Serial.print("\tenemy_order :");
  Serial.print(enemy_orderbullet);
  Serial.print(" | ");
  for(int i=0;i<enemy_maxbullet;i++){
    Serial.print(enemy_bullet[i].x);
    Serial.print(",");
    Serial.print(enemy_bullet[i].y);
    Serial.print("  ");
  }
  
  Serial.println();
}
//-------------------------------------------------------------------------- Function --------------
