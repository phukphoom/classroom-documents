#include "LedControl.h"
#include "FontLEDClock.h"

#define BUTTON_MODE   3
#define BUTTON_UP     7
#define BUTTON_DOWN   8
#define BUTTON_ENTER  9

#define CS_PIN        10
#define CLK_PIN       13
#define DIN_PIN       11

//----------------------------------------------------------------------------------------- Variable Set -------------------------
LedControl lc = LedControl(11,13,10,4);
short intensity = 8;

enum{
  MODE_SETCLOCK = 0,
  MODE_SHOWCLOCK,
  CountMODE
};
unsigned mode = MODE_SETCLOCK;

struct Clock{
  unsigned hour = 0;
  unsigned minute = 0;
  unsigned second = 0;
}clock;
//--------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------- Interrupt Service Routine -------------
float timer1_start = 3036;                    // second : 65535-62500 (+1) = 3035 (+1)
ISR(TIMER1_OVF_vect)                          // <-- Main Clock timer              
{
  TCNT1 = timer1_start;                       // preload timer
  clock.second++;
  if(clock.second==60){
    clock.second = 0;
    clock.minute++;
  }
  if(clock.minute==60){
    clock.minute = 0;
    clock.hour++;
  }
}
//--------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------- Setup Program ------------------------
void setup(){ 
  initPin();
  initTimer();
  initLed();
  Serial.begin(9600);
}
//--------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------- Main Program -------------------------
void loop(){
  select_mode();
  if(mode == MODE_SETCLOCK){
    set_clock();
  }
  else if(mode == MODE_SHOWCLOCK){
    show_clock();
    set_intensity();
  }
}
//--------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------- User Define Func ---------------------
/************** Initialization **********************/
void initPin(){
  pinMode(BUTTON_MODE,INPUT_PULLUP);
  pinMode(BUTTON_UP,INPUT_PULLUP);
  pinMode(BUTTON_DOWN,INPUT_PULLUP);
  pinMode(BUTTON_ENTER,INPUT_PULLUP);
}
void initTimer(){
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = timer1_start;          
  TCCR1B = TCCR1B|(1 << CS12);  
  TIMSK1 = TIMSK1|(1 << TOIE1); 
  interrupts();
}
void initLed(){
  unsigned devices = lc.getDeviceCount();
  for(unsigned address=0; address<devices; address++){
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}

/************** Clock working ***********************/
void select_mode(){
  if(digitalRead(BUTTON_MODE)==LOW){
    mode++;
    if(mode > CountMODE-1){
      mode = 0;
    }
    show_curr_mode();             //This func has delay 500ms
  }  
}
void show_curr_mode(){
  clear_display();
  if(mode == MODE_SETCLOCK){
    print_char(1,1,'C');
    print_char(5,1,'L');
    print_char(9,1,'K');
    print_char(14,1,'.');
    print_char(17,1,'S');
    print_char(21,1,'E');
    print_char(25,1,'T');
  }
  else if(mode == MODE_SHOWCLOCK){
    print_char(1,1,'C');
    print_char(5,1,'L');
    print_char(9,1,'K');
    print_char(14,1,'.');
    print_char(17,1,'R');
    print_char(21,1,'U');
    print_char(25,1,'N');
  }
  delay(500);
  clear_display();
}

void set_clock(){
  short setclock[3];
  setclock[0] = clock.hour;     
  setclock[1] = clock.minute;   
  setclock[2] = clock.second; 

  short index = 0;
  while(mode == MODE_SETCLOCK){   
    select_mode();
    if(digitalRead(BUTTON_UP)==LOW){
      setclock[index]++;
      if(setclock[0]>23){
        setclock[0] = 0;
      }
      if(setclock[1]>59){
        setclock[1] = 0;
      }
      if(setclock[2]>59){
        setclock[2] = 0;
      }
    }
    if(digitalRead(BUTTON_DOWN)==LOW){
      setclock[index]--;
      if(setclock[0]<0){
        setclock[0] = 23;
      }
      if(setclock[1]<0){
        setclock[1] = 59;
      }
      if(setclock[2]<0){
        setclock[2] = 59;
      }
    }
    
    if(digitalRead(BUTTON_ENTER)==LOW){
      index++;
      if(index>2){
        index = 0;
      } 
    }
   
    print_char( 2, 1, setclock[0] / 10 + '0');          //Show setclock
    print_char( 6, 1, setclock[0] % 10 + '0');
    print_char( 9, 1, ':');
    print_char(12, 1, setclock[1] / 10 + '0'); 
    print_char(17, 1, setclock[1] % 10 + '0');
    print_char( 20, 1, ':'); 
    print_char(23, 1, setclock[2] / 10 + '0'); 
    print_char(27, 1, setclock[2] % 10 + '0');
    
    delay(50);                                          //Debouncing 100 ms
  }

  clock.hour = setclock[0];
  clock.minute = setclock[1];
  clock.second = setclock[2];
}
void show_clock(){
  print_char( 2, 1, clock.hour / 10 + '0');             //print hour
  print_char( 6, 1, clock.hour % 10 + '0');
  
  print_char(12, 1, clock.minute / 10 + '0');           //print minute
  print_char(17, 1, clock.minute % 10 + '0');
  
  print_char(23, 1, clock.second / 10 + '0');           //print second
  print_char(27, 1, clock.second % 10 + '0');

  if(mode == MODE_SHOWCLOCK && clock.second % 2 != 0){  //print ':' with brink
    print_char( 9, 1, ' ');
    print_char( 20, 1, ' ');  
  }
  else{
    print_char( 9, 1, ':');
    print_char( 20, 1, ':');
  }
}

/************** Dispaly Led Dotmatrix ***************/
void plot(unsigned x ,unsigned y ,bool value){
  unsigned address;
  if(x >= 0 && x <= 7){
    address = 3;
  }
  if(x >= 8 && x <= 15){
    address = 2;
    x = x - 8;
  }
  if(x >= 16 && x <= 23){
    address = 1;
    x = x - 16;
  }
  if(x >= 24 && x <= 34){
    address = 0;
    x = x - 24;
  }

  lc.setLed(address,y,x,value);
}
void clear_display(){
  for(unsigned address=0; address<4; address++){
    lc.clearDisplay(address);
  }
}
void set_intensity(){
  if(digitalRead(BUTTON_UP)==LOW){
    intensity++;
  }
  else if(digitalRead(BUTTON_DOWN)==LOW){
    intensity--;
  }

  if(intensity<0){
    intensity = 0;
  }
  else if(intensity>15){
    intensity = 15;
  }
  
  for(unsigned address=0; address<4; address++){
    lc.setIntensity(address,intensity);
  }
}
void print_char(unsigned x ,unsigned y ,char c){
  unsigned dots;
  if (c >= 'A' && c <= 'Z' || (c >= 'a' && c <= 'z') ) { c &= 0x1F; }   // A-Z maps to 1-26 
  else if (c >= '0' && c <= '9') { c = (c - '0') + 32; }
  else if (c == ' ') { c = 0;  }                                        // space 
  else if (c == '.') { c = 27; }                                        // full stop 
  else if (c == ':') { c = 28; }                                        // colon 
  else if (c == '\''){ c = 29; }                                        // single quote mark 
  else if (c == '!') { c = 30; }                                        // single quote mark 
  else if (c == '?') { c = 31; }                                        // single quote mark 

  for (uint8_t col = 0; col < 3; col++) {
    dots = pgm_read_byte_near(&mytinyfont[c][col]);
    for (uint8_t row = 0; row < 5; row++) {
      if (dots & (16 >> row))
        plot(x + col, y + row, true);
      else
        plot(x + col, y + row, false);
    }
  }
}
