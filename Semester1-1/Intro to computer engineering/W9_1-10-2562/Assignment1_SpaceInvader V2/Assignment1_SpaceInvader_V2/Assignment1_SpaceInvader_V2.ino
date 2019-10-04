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
typedef struct Ship{
  int x;
  int y;
  int HP = 8;
}Ship;
typedef struct Bullet{
  bool status = false;
  int x = 999;
  int y = 999;
}Bullet;

LedControl lc = LedControl(DIN_PIN ,CLK_PIN ,CS_PIN ,LED_MODULE);
unsigned long delaytime = 100;        // time to update display

const int player_maxbullet = 5;
int player_orderbullet = 0;

const int enemy_maxbullet = 5;
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
  
  led_init();
  game_init();
  
  player_ship.x = 3;
  player_ship.y = 31;
  enemy_ship.x = 3;
  enemy_ship.y = 8;
}
void loop(){
  //-------------------------------- Check order --------------------------
  player_orderbullet = check_order(1); // checkorder of player_bullet
  enemy_orderbullet = check_order(2);  // checkorder of enemy_bullet
  //-------------------------------- enemy movement -----------------------
  int enemy_movement = random(1,5);   // 1 move left [25%],2-3 not move[50%],4 move right [25%]
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
  if(enemy_orderbullet!=-1 && enemy_bullet[enemy_orderbullet].status==false){
    if(random(0,101)>=70){             // chance to shoot is 30%
      enemy_bullet[enemy_orderbullet].status = true;
      enemy_bullet[enemy_orderbullet].x = enemy_ship.x;
      enemy_bullet[enemy_orderbullet].y = enemy_ship.y+1;
    }
  }
  //-------------------------------- player movement ----------------------
  if(analogRead(0)<300){ // this joy range 0-1023
    if(!overframe(player_ship.x-1,player_ship.y)){
      player_ship.x--;
    }
  }
  else if(analogRead(0)>700){
    if(!overframe(player_ship.x+1,player_ship.y)){
      player_ship.x++;
    }
  }
  if(analogRead(1)>700){
    if(!overframe(player_ship.x,player_ship.y-1)){
      player_ship.y--;
    }
  }
  else if(analogRead(1)<300){
    if(!overframe(player_ship.x,player_ship.y+1)){
      player_ship.y++;
    }
  }
  if(digitalRead(JoyC)==LOW){
    if(player_orderbullet!=-1 && player_bullet[player_orderbullet].status==false){
      player_bullet[player_orderbullet].status = true;
      player_bullet[player_orderbullet].x = player_ship.x;
      player_bullet[player_orderbullet].y = player_ship.y-1;
    }
  }
  //-------------------------------- Checking -------------------------------
  //showdebuglog(); 
  check_bullet_hit();
  check_player_dmg();
  check_enemy_dmg();
  //-------------------------------- Drawing --------------------------------
  draw_player_ship(player_ship.x,player_ship.y);
  draw_enemy_ship(enemy_ship.x,enemy_ship.y);
  for(int i=0;i<player_maxbullet;i++){
    if(player_bullet[i].status==true){
      draw_bullet(player_bullet[i].x,player_bullet[i].y);
    }
  }
  for(int i=0;i<enemy_maxbullet;i++){
    if(enemy_bullet[i].status==true){
      draw_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
    }
  }
  //-------------------------------- Delay ----------------------------------
  delay(delaytime);
  //-------------------------------- Erasing --------------------------------
  erase_player_ship(player_ship.x,player_ship.y);
  erase_enemy_ship(enemy_ship.x,enemy_ship.y);
  for(int i=0;i<player_maxbullet;i++){
    if(player_bullet[i].status==true){
      erase_bullet(player_bullet[i].x,player_bullet[i].y);
      player_bullet[i].y--;
      if(overframe(player_bullet[i].x,player_bullet[i].y)){
        player_bullet[i].status = false;
        player_bullet[i].x = 999;
        player_bullet[i].y = 999;
      }
    }
  }
  for(int i=0;i<enemy_maxbullet;i++){
    if(enemy_bullet[i].status==true){
      erase_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
      enemy_bullet[i].y++;
      if(overframe(enemy_bullet[i].x,enemy_bullet[i].y)){
        enemy_bullet[i].status = false;
        enemy_bullet[i].x = 999;
        enemy_bullet[i].y = 999;
      }
    }
  }
  //-------------------------------- Game Ending -----------------------------
  if(player_ship.HP<=0){
    endscreen();
    for(int i=0;i<3;i++){
      clear_display();
      delay(100);
      losescreen();
      delay(500);   
    }
    delay(100000);
  }
  else if(enemy_ship.HP<=0){
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
void led_init(){
  int devices = lc.getDeviceCount(); //find number of devices
  for(int address=0;address<devices;address++){
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}
void game_init(){
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
void plot(int x,int y){
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
void delete_plot(int x,int y){
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
void clear_display(){
  int devices = lc.getDeviceCount();
  for(int address=0;address<devices;address++){
    lc.clearDisplay(address);
  }
}
//---------------------------------- Game system ------------------------------
void draw_player_ship(int x,int y){  
  plot(x-1,y); 
  plot(x,y);   
  plot(x+1,y);
  plot(x,y-1);
}
void draw_enemy_ship(int x,int y){  
  plot(x-1,y); 
  plot(x,y);   
  plot(x+1,y);
  plot(x,y+1);
}
void draw_bullet(int x,int y){
  plot(x,y);
}

void erase_player_ship(int x,int y){
  delete_plot(x-1,y); 
  delete_plot(x,y);   
  delete_plot(x+1,y);
  delete_plot(x,y-1);
}
void erase_enemy_ship(int x,int y){
  delete_plot(x-1,y); 
  delete_plot(x,y);   
  delete_plot(x+1,y);
  delete_plot(x,y+1);
}
void erase_bullet(int x ,int y){
  delete_plot(x,y);
}

bool overframe(int x ,int y){
  if(x>=0 && x<8 && y>=8 && y<32){
    return false;
  }
  else{
    return true;
  }
}

int check_order(int option){ // 1 is player_bullet ,2 is enemy_bullet
  if(option==1){
    for(int i=0;i<player_maxbullet;i++){
      if(player_bullet[i].status==false){
        return i;
      }
    }
    return -1;
  }
  if(option==2){
    for(int i=0;i<enemy_maxbullet;i++){
      if(enemy_bullet[i].status==false){
        return i;
      }
    }
    return -1;
  }
}
void check_bullet_hit(){
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
void check_player_dmg(){
  for(int i=0;i<enemy_maxbullet;i++){
    if((enemy_bullet[i].x==player_ship.x && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x-1 && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x+1 && enemy_bullet[i].y==player_ship.y) || (enemy_bullet[i].x==player_ship.x && enemy_bullet[i].y==player_ship.y-1)){
      if(enemy_bullet[i].status==true){
        player_ship.HP--;
        decrease_player_HP();
        erase_bullet(enemy_bullet[i].x,enemy_bullet[i].y);
        enemy_bullet[i].status = false;
        enemy_bullet[i].x = 999;
        enemy_bullet[i].y = 999;
      }
    } 
  }
}
void check_enemy_dmg(){
  for(int i=0;i<player_maxbullet;i++){
    if((player_bullet[i].x==enemy_ship.x && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x-1 && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x+1 && player_bullet[i].y==enemy_ship.y) || (player_bullet[i].x==enemy_ship.x && player_bullet[i].y==enemy_ship.y+1)){
      if(player_bullet[i].status==true){
        enemy_ship.HP--;
        decrease_enemy_HP();
        erase_bullet(player_bullet[i].x,player_bullet[i].y);
        player_bullet[i].status = false;
        player_bullet[i].x = 999;
        player_bullet[i].y = 999;
      }
    } 
  }
}

void decrease_player_HP(){
  delete_plot(player_ship.HP,0);
}
void decrease_enemy_HP(){
  delete_plot(enemy_ship.HP,2);
}

void endscreen(){
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
void winscreen(){
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
void losescreen(){
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
