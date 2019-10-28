#include "LedControl.h"
#include "FontLEDClock.h"
#include "StackArray.h"

#define BUTTON_BACK   3
#define BUTTON_UP     7
#define BUTTON_DOWN   8
#define BUTTON_ENTER  9

#define CS_PIN        10
#define CLK_PIN       13
#define DIN_PIN       11

//---------------------------------------------------------------------- Variable Setup -----------------------
LedControl lc = LedControl(11,13,10,4);
short ledIntensity = 8;

enum{
  STATE_HOME = 0,
  
  STATE_MENU,
  STATE_SETTIME,
  STATE_SETALARM,
  
  CountSTATE
};
StackArray<int> state;
unsigned selectState = STATE_HOME;

struct Clock{
  unsigned hour = 0;
  unsigned minute = 0;
  unsigned second = 0;
}clock;
struct Alarmclock{
  unsigned hour = 0;
  unsigned minute = 0;
  unsigned second = 0;
  bool enable = false;
}alarmclock;
//--------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------- Interrupt Service Routine -------------
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
  if(clock.hour==24){
    clock.hour = 0;
  }
}
//-------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------- Setup Program ------------------------
void setup(){ 
  initPin();
  initTimer();
  initLed();
  initState();
  
  Serial.begin(9600);
}
//-------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------- Main Program -------------------------
void loop(){
  unsigned currentState = state.peek(); Serial.println(state.count());
//------------  
  if(currentState == STATE_HOME){           /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_BACK*/
    show_clock();
    show_alarm_enable_bar();
    
    set_intensity();
    if(digitalRead(BUTTON_BACK)==LOW){
      delay(120);                           //debouncing 120ms
      state.push(STATE_MENU);
      clear_display();
    }

    if(alarmclock.enable){
      if(clock.hour == alarmclock.hour && clock.minute == alarmclock.minute){
        alert_alarm();
        if(clock.second==59){
          alarmclock.enable = false;
        }
      }
      if(digitalRead(BUTTON_ENTER)==LOW){
        delay(120);                         //debouncing 120ms
        alarmclock.enable = false;
      }
    }
  } 
//------------  
  else if(currentState == STATE_MENU){       /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    show_selectstate();
    
    if(digitalRead(BUTTON_UP)==LOW){
      delay(120);       //debouncing 120ms
      selectState--;
    }
    else if(digitalRead(BUTTON_DOWN)==LOW){
      delay(120);       //debouncing 120ms
      selectState++;
    }
    else if(digitalRead(BUTTON_ENTER)==LOW){
      delay(120);       //debouncing 120ms
      state.push(selectState);
      clear_display();
    }
    else if(digitalRead(BUTTON_BACK)==LOW){
      delay(100);
      state.pop();
      clear_display();
    }

    if(selectState<=STATE_MENU){
      selectState = STATE_MENU+1;
    }
    else if(selectState>=CountSTATE){
      selectState = CountSTATE-1;
    }
  }
//------------ 
  if(currentState == STATE_SETTIME){        /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    loop_set_clock();
  }
//------------ 
  else if(currentState == STATE_SETALARM){  /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    loop_set_alarm();
  }
}

//--------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------- User Define Func ---------------------
/************** Initialization **********************/
void initPin(){
  pinMode(BUTTON_BACK,INPUT_PULLUP);
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
void initState(){
  state.push(STATE_HOME);
}

/************** Main Menu State *************************/
void show_selectstate(){
  if(selectState==STATE_SETTIME){
    print_char(1,1,'S');
    print_char(5,1,'E');
    print_char(9,1,'T');
    print_char(13,1,':');
    print_char(17,1,'T');
    print_char(21,1,'I');
    print_char(25,1,'M');
    print_char(29,1,'E');
  }
  else if(selectState==STATE_SETALARM){
    print_char(1,1,'S');
    print_char(5,1,'E');
    print_char(9,1,'T');
    print_char(13,1,':');
    print_char(17,1,'A');
    print_char(21,1,'L');
    print_char(25,1,'R');
    print_char(29,1,'M');
  }
}

/************** Home State ******************************/
void show_clock(){
  print_char( 2, 1, clock.hour / 10 + '0');             //print hour
  print_char( 6, 1, clock.hour % 10 + '0');
  
  print_char(12, 1, clock.minute / 10 + '0');           //print minute
  print_char(17, 1, clock.minute % 10 + '0');
  
  print_char(23, 1, clock.second / 10 + '0');           //print second
  print_char(27, 1, clock.second % 10 + '0');

  if(clock.second % 2 != 0){                            //print ':' with brink
    print_char( 9, 1, ' ');
    print_char( 20, 1, ' ');  
  }
  else{
    print_char( 9, 1, ':');
    print_char( 20, 1, ':');
  }
}

/************** Set time State **************************/
void loop_set_clock(){
  bool setting = true;
  int settingClock[3];
  settingClock[0] = clock.hour;     
  settingClock[1] = clock.minute;   
  settingClock[2] = clock.second; 

  int index = 0;
  while(setting){
    //Display Set Clock
    print_char( 2, 1, settingClock[0] / 10 + '0');          
    print_char( 6, 1, settingClock[0] % 10 + '0');
    print_char( 9, 1, ':');
    print_char(12, 1, settingClock[1] / 10 + '0'); 
    print_char(17, 1, settingClock[1] % 10 + '0');
    print_char( 20, 1, ':'); 
    print_char(23, 1, settingClock[2] / 10 + '0'); 
    print_char(27, 1, settingClock[2] % 10 + '0');
    delay(120);                                                //Delay display and Debouncing 120 ms
    if(index == 0){
      print_char(2,1,' ');
      print_char(6,1,' ');
    }
    else if(index == 1){
      print_char(12,1,' ');
      print_char(17,1,' ');
    }
    else if(index == 2){
      print_char(23,1,' ');
      print_char(27,1,' ');
    }
    
    if(digitalRead(BUTTON_UP)==LOW){
      settingClock[index]++;
      if(settingClock[0]>23){
        settingClock[0] = 0;
      }
      if(settingClock[1]>59){
        settingClock[1] = 0;
      }
      if(settingClock[2]>59){
        settingClock[2] = 0;
      }
    }
    if(digitalRead(BUTTON_DOWN)==LOW){
      settingClock[index]--;
      if(settingClock[0]<0){
        settingClock[0] = 23;
      }
      if(settingClock[1]<0){
        settingClock[1] = 59;
      }
      if(settingClock[2]<0){
        settingClock[2] = 59;
      }
    }
    if(digitalRead(BUTTON_ENTER)==LOW){
      index++;
      if(index>2){
        index = 0;
      } 
    }
    if(digitalRead(BUTTON_BACK)==LOW){
      clock.hour = settingClock[0];
      clock.minute = settingClock[1];
      clock.second = settingClock[2];
      setting = false;
      
      state.pop();
      clear_display();
    }
  }
}

/************** Set Alarm State *************************/
void loop_set_alarm(){
  show_alarm_enable_bar();
  
  bool setting = true;
  short settingClock[3];
  settingClock[0] = alarmclock.hour;     
  settingClock[1] = alarmclock.minute;   
  settingClock[2] = alarmclock.second; 

  short index = 0;
  while(setting){
    //Display Set Alarm   
    print_char( 2, 1, settingClock[0] / 10 + '0');          
    print_char( 6, 1, settingClock[0] % 10 + '0');
    print_char( 9, 1, ':');
    print_char(12, 1, settingClock[1] / 10 + '0'); 
    print_char(17, 1, settingClock[1] % 10 + '0');
    print_char( 20, 1, ':'); 
    print_char(23, 1, settingClock[2] / 10 + '0'); 
    print_char(27, 1, settingClock[2] % 10 + '0');
    delay(120);                                                //Delay display and Debouncing 120 ms
    if(index == 0){
      print_char(2,1,' ');
      print_char(6,1,' ');
    }
    else if(index == 1){
      print_char(12,1,' ');
      print_char(17,1,' ');
    }
    else if(index == 2){
      print_char(23,1,' ');
      print_char(27,1,' ');
    }

    if(digitalRead(BUTTON_UP)==LOW){
      settingClock[index]++;
      if(settingClock[0]>23){
        settingClock[0] = 0;
      }
      if(settingClock[1]>59){
        settingClock[1] = 0;
      }
      if(settingClock[2]>59){
        settingClock[2] = 0;
      }
    }
    if(digitalRead(BUTTON_DOWN)==LOW){
      settingClock[index]--;
      if(settingClock[0]<0){
        settingClock[0] = 23;
      }
      if(settingClock[1]<0){
        settingClock[1] = 59;
      }
      if(settingClock[2]<0){
        settingClock[2] = 59;
      }
    }
    if(digitalRead(BUTTON_ENTER)==LOW){
      long long pressed = millis();
      while(digitalRead(BUTTON_ENTER)==LOW && millis()-pressed < 1000){
        // wait pressed Enter
        print_char( 2, 1, settingClock[0] / 10 + '0');          
        print_char( 6, 1, settingClock[0] % 10 + '0');
        print_char( 9, 1, ':');
        print_char(12, 1, settingClock[1] / 10 + '0'); 
        print_char(17, 1, settingClock[1] % 10 + '0');
        print_char( 20, 1, ':'); 
        print_char(23, 1, settingClock[2] / 10 + '0'); 
        print_char(27, 1, settingClock[2] % 10 + '0');
      }
      if(millis()-pressed < 1000){
        index++;
        if(index>2){
          index = 0;
        }
      }
      else{
        alarmclock.hour = settingClock[0];
        alarmclock.minute = settingClock[1];
        alarmclock.second = settingClock[2];
        
        alarmclock.enable = !alarmclock.enable;
        show_alarm_enable_bar();
      }
    }
    if(digitalRead(BUTTON_BACK)==LOW){
      setting = false;
      
      state.pop();
      clear_display();
    }
  }
}

void show_alarm_enable_bar(){
  for(int x=2;x<30;x++){
    plot(x,7,alarmclock.enable);
  }
}

void alert_alarm(){
  for(int x=2;x<30;x++){
    plot(x,7,true);
  }
  
  delay(100);
  
  for(int x=2;x<30;x++){
    plot(x,7,false);
  }
  
}

/************** Display *********************************/
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
void set_intensity(){
  if(digitalRead(BUTTON_UP)==LOW){
    ledIntensity++;
  }
  else if(digitalRead(BUTTON_DOWN)==LOW){
    ledIntensity--;
  }

  if(ledIntensity<0){
    ledIntensity = 0;
  }
  else if(ledIntensity>15){
    ledIntensity = 15;
  }
  
  for(unsigned address=0; address<4; address++){
    lc.setIntensity(address,ledIntensity);
  }
}
void clear_display(){
  for(unsigned address=0; address<4; address++){
    lc.clearDisplay(address);
  }
}
