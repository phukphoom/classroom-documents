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
  int x = 4;
  int y = 31;
  int HP = 8;
  int score = 0;
}Ship;
typedef struct Bullet{
  bool status = false;
  int x = 88888;
  int y = 88888;
}Bullet;
typedef struct Bomb{
  bool status = false;
  int x = 99999;
  int y = 99999;
}Bomb;

LedControl lc = LedControl(DIN_PIN ,CLK_PIN ,CS_PIN ,LED_MODULE);
unsigned long delaytime = 100;        // time to update display

const int maxbullet = 10;
int numbullet = 0;
int orderbullet = 0;

const int maxbomb = 5;
int numbomb = 0;
int orderbomb = 0;

Ship ship;
Bullet bullet[maxbullet];
Bomb bomb[maxbomb];
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
}
void loop(){
  //-------------------------------- debug zone ---------------------------
  //showdebuglog(); 
  //-------------------------------- Check order --------------------------
  orderbullet = check_order(1); // checkorder of bullet
  orderbomb = check_order(2);   // checkorder of bomb
  //-------------------------------- Gen Bomb -----------------------------
  if(numbomb<maxbomb&&bomb[orderbomb].status==false){
    if(random(0,75)>random(0,100)){
      bomb[orderbomb].status = true;
      bomb[orderbomb].x = random(0,8);
      bomb[orderbomb].y = 8;
      numbomb++;
    }
  }
  //-------------------------------- Control ------------------------------
  if(analogRead(0)<300){ // this joy range 0-1023
    if(!overframe(ship.x-1,ship.y)){
      ship.x--;
    }
  }
  else if(analogRead(0)>700){
    if(!overframe(ship.x+1,ship.y)){
      ship.x++;
    }
  }
  if(analogRead(1)>700){
    if(!overframe(ship.x,ship.y-1)){
      ship.y--;
    }
  }
  else if(analogRead(1)<300){
    if(!overframe(ship.x,ship.y+1)){
      ship.y++;
    }
  }
  if(digitalRead(JoyC)==LOW){
    if(bullet[orderbullet].status==false){
      bullet[orderbullet].status = true;
      bullet[orderbullet].x = ship.x;
      bullet[orderbullet].y = ship.y-1;
      numbullet++;
    }
  }
  //-------------------------------- Check smash ----------------------------
  check_bullethit();
  check_shiphit();
  //-------------------------------- Drawing --------------------------------
  draw_ship(ship.x,ship.y);
  for(int i=0;i<maxbullet;i++){
    if(bullet[i].status==true){
      draw_bullet(bullet[i].x,bullet[i].y);
    }
  }
  for(int i=0;i<maxbomb;i++){
    if(bomb[i].status==true){
      draw_bomb(bomb[i].x,bomb[i].y);
    }
  }
  
  //-------------------------------- Delay ----------------------------------
  delay(delaytime);
  
  //-------------------------------- Erasing --------------------------------
  erase_ship(ship.x,ship.y);
  for(int i=0;i<maxbullet;i++){
    if(bullet[i].status==true){
      erase_bullet(bullet[i].x,bullet[i].y);
      bullet[i].y--;
      if(overframe(bullet[i].x,bullet[i].y)){
        bullet[i].status = false;
        numbullet--;
        bullet[i].x = 99999;
        bullet[i].y = 99999;
      }
    }
  }
  for(int i=0;i<maxbomb;i++){
    if(bomb[i].status==true){
      erase_bomb(bomb[i].x,bomb[i].y);
      bomb[i].y++;
      if(overframe(bomb[i].x,bomb[i].y)){
        bomb[i].status = false;
        numbomb--;
        bomb[i].x = 88888;
        bomb[i].y = 88888;
      }
    }
  }
  
  //-------------------------------- Game Ending -----------------------------
  if(ship.HP<=0){
    endscreen();
    for(int i=0;i<3;i++){
      clear_display();
      delay(100);
      losescreen();
      delay(500);   
    }
    delay(100000);
  }
  else if(ship.score>=8){
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
void draw_ship(int x,int y){  
  plot(x-1,y); 
  plot(x,y);   
  plot(x+1,y);
  plot(x,y-1);
}
void draw_bullet(int x,int y){
  plot(x,y);
}
void draw_bomb(int x,int y){
  plot(x,y);
}

void erase_ship(int x,int y){
  delete_plot(x-1,y); 
  delete_plot(x,y);   
  delete_plot(x+1,y);
  delete_plot(x,y-1);
}
void erase_bullet(int x ,int y){
  delete_plot(x,y);
}
void erase_bomb(int x ,int y){
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

int check_order(int option){ // 1 is bullet ,2 is bomb
  if(option==1){
    for(int i=0;i<maxbullet;i++){
      if(bullet[i].status==false){
        return i;
      }
    }
    return -1;
  }
  if(option==2){
    for(int i=0;i<maxbomb;i++){
      if(bomb[i].status==false){
        return i;
      }
    }
    return -1;
  }
}
void check_bullethit(){
  for(int i=0;i<maxbullet;i++){
    for(int j=0;j<maxbomb;j++){
      if(bullet[i].x==bomb[j].x && bullet[i].y<=bomb[j].y){
        ship.score++;
        increase_score();
        Serial.println("!!HIT!!");
        
        delete_plot(bullet[i].x,bullet[i].y);
        delete_plot(bomb[j].x,bomb[j].y);
        numbomb--;
        numbullet--;
        
        bullet[i].status = false;
        bullet[i].x = 88888;
        bullet[i].y = 88888;
        
        bomb[j].y = 99999;
        bomb[j].y = 99999;
        bomb[j].status = false;  
      }
    }
  }
}
void check_shiphit(){
  for(int i=0;i<maxbomb;i++){
    if(bomb[i].x==ship.x && bomb[i].y==ship.y || bomb[i].x==ship.x-1 && bomb[i].y==ship.y || bomb[i].x==ship.x+1 && bomb[i].y==ship.y || bomb[i].x==ship.x && bomb[i].y==ship.y-1){
      ship.HP--;
      decrease_HP();
      delete_plot(bomb[i].x,bomb[i].y);
      numbomb--;
    
      bomb[i].y = 99999;
      bomb[i].y = 99999;
      bomb[i].status = false;
    } 
  }
}

void increase_score(){
  plot(ship.score-1,2);
}
void decrease_HP(){
  delete_plot(ship.HP,0);
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
  Serial.print("analog_x :");
  Serial.print(analogRead(0)); 
  Serial.print("\tanalog_y :"); 
  Serial.print(analogRead(1)); 
  
  Serial.print("\t||\tship :");
  Serial.print(ship.x); 
  Serial.print(","); 
  Serial.print(ship.y);

  Serial.print("\t||\tbullet..status :");
  for(int i=0;i<maxbullet;i++){
    Serial.print(bullet[i].status); 
    Serial.print(" ");
  }
  Serial.print("\torder :");
  Serial.print(orderbullet);
  Serial.print("\tnum :");
  Serial.print(numbullet);
  
  Serial.print("\t||\tbomb..status :");
  for(int i=0;i<maxbomb;i++){
    Serial.print(bomb[i].status); 
    Serial.print(" ");
  }
  Serial.print("\torder :");
  Serial.print(orderbomb);
  Serial.print("\tnum :");
  Serial.print(numbomb);
  
  Serial.print("\tHP :");
  Serial.print(ship.HP);
  Serial.print("\tscore :");
  Serial.print(ship.score);
  
  Serial.println();
}
//-------------------------------------------------------------------------- Function --------------
