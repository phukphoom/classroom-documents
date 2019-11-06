#include "ST7735_TEE.h"
#include "StackArray.h"

#define BUTTON_BACK   5
#define BUTTON_UP     2
#define BUTTON_DOWN   4
#define BUTTON_ENTER  3

//////////////////////////////////////////////////////////////////////// Variable Setup ////////////////////////////////////////////////////////////////////////
TEE_ST7735 lcd(9, 10, 11, 12, 13);          // pin  CSK,SDA,A0,RST,CS

enum{                                       // create enum list for map state with number
  STATE_HOME = 0,
  STATE_MENUMAIN,
  
  START_MAIN_STATE,
    STATE_MENUSET,
    STATE_STOPWATCH,
    STATE_COUNTDOWN,
  END_MAIN_STATE,
  
  START_SUB_STATE_SET,
      STATE_SETTIME,
  END_SUB_STATE_SET,
};
StackArray<byte> state;                       // create <stack>state to keep state
byte selectState = STATE_HOME;                // create selectState to use in MAINMENU, MENUSET State for select next state to go

struct Clock{                                 // create clock
  byte hour = 0;
  byte minute = 0;
  byte second = 0;
}clock;
struct Stopwatch{                             // create stopwatch
  byte minute = 0;
  byte second = 0;
  unsigned millisec = 0;
  bool running = false;
}stopwatch;
struct Countdown{                             // create countdown
  short hour = 0;
  short minute = 0;
  short second = 0;
  bool running = false;
}countdown;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Interrupt Service Routine /////////////////////////////////////////////////////////////
float timer1_start = 3036;                    // timer start point #second : 65535-62500 (+1) = 3035 (+1))
ISR(TIMER1_OVF_vect)                          // Main Clock timer              
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Setup Program /////////////////////////////////////////////////////////////////////////
void setup(){ 
  initPin();
  initTimer();
  initLcd();
  initState();
  Serial.begin(9600);
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Main Program //////////////////////////////////////////////////////////////////////////
void loop(){
  //------------ get top of <stack>state to currentState ------------
  unsigned currentState = state.peek();
    
  //---------------------- STATE_HOME -------------------------------
  if(currentState == STATE_HOME){           
    show_clock();                                           // show main clock counting
    if(digitalRead(BUTTON_BACK)==LOW){
      delay(120);                                           // debouncing 120ms
      state.push(STATE_MENUMAIN);                           // push STATE_MENUMAIN to <stack>state
      clear_display();
    }
  } 
  
  //---------------------- STATE_MENUMAIN ----------------------------
  else if(currentState == STATE_MENUMAIN){  
    selector_state(START_MAIN_STATE,END_MAIN_STATE);        // show MAINMENU list for go to next state
  }
  
  //---------------------- STATE_MENUSET -----------------------------
  else if(currentState == STATE_MENUSET){
    selector_state(START_SUB_STATE_SET,END_SUB_STATE_SET);  // show SETMENU list for go to next state
  }
  
  //---------------------- STATE_SETTIME -----------------------------
  else if(currentState == STATE_SETTIME){  
    loop_set_clock();                                       // set clock use loop in func
  }  
  //---------------------- STATE_STOPWATCH ---------------------------
  else if(currentState == STATE_STOPWATCH){
    loop_stopwatch();                                       // run stopwatch with loop in func
  }
  
  //---------------------- STATE_COUNTDOWN ---------------------------
  else if(currentState == STATE_COUNTDOWN){ 
    loop_countdown();                                       // run countdown with loop in func
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// User Define Func //////////////////////////////////////////////////////////////////////
/********************* Initialization **************************/
void initPin(){                                      // func to set initPin
  pinMode(BUTTON_BACK,INPUT_PULLUP);
  pinMode(BUTTON_UP,INPUT_PULLUP);
  pinMode(BUTTON_DOWN,INPUT_PULLUP);
  pinMode(BUTTON_ENTER,INPUT_PULLUP);
}
void initTimer(){                                    // func to set initTimer1
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = timer1_start;          
  TCCR1B = TCCR1B|(1 << CS12);  
  TIMSK1 = TIMSK1|(1 << TOIE1); 
  interrupts();
}
void initLcd(){                                      // func to set initLcd
  lcd.init(lcd.VERTICAL);
  lcd.fillScreen(BLACK);
}
void initState(){                                    // func to set initState
  state.push(STATE_HOME);                                     // push STATE_HOME to <stack>state for initial
}

/********************* Function in STATE_HOME ******************/
void show_clock(){                                   // func to show mainclock count on TFT
  print_char( 20, 72, clock.hour / 10 + '0');                   // print hour 
  print_char( 31, 72, clock.hour % 10 + '0');
  
  print_char(53, 72, clock.minute / 10 + '0');                 // print minute
  print_char(64, 72, clock.minute % 10 + '0');
  
  print_char(86, 72, clock.second / 10 + '0');                 // print second
  print_char(97, 72, clock.second % 10 + '0');

  if(clock.second % 2 != 0){                                  // print ':' with brink
    print_char( 42, 72, ' ');
    print_char( 75, 72, ' ');  
  }
  else{
    print_char( 42, 72, ':');
    print_char( 75, 72, ':');
  }
}

/********************* Function in MENUMAIN, MENUSET ***********/
void selector_state(byte startstate, byte endstate){  // func to create & manage list for MENUMAIN, MENUSET state
  //------------ scope range of list state from enum  ---------------
  if(selectState<=startstate){                                 
    selectState = startstate+1;
  }
  else if(selectState>=endstate){
    selectState = endstate-1;
  }
  
  //------------ display seletState on TFT ----------------------------
  show_selectstate();  

  //---------------------- get input ----------------------------------
  if(digitalRead(BUTTON_UP)==LOW){
    delay(120);                                                 // debouncing 120ms
    selectState--;
  }
  else if(digitalRead(BUTTON_DOWN)==LOW){
    delay(120);                                                 // debouncing 120ms
    selectState++;
  }
  else if(digitalRead(BUTTON_ENTER)==LOW){
    delay(120);                                                 // debouncing 120ms
    state.push(selectState);
    clear_display();
  }
  else if(digitalRead(BUTTON_BACK)==LOW){
    delay(120);                                                 // debouncing 120ms
    state.pop();                                                // pop top of <stack>state when go back state
    selectState = state.peek();                                 // selectState point to new top of <stack>state
    clear_display();
  }
}
void show_selectstate(){                              // func to show selectState on TFT
  //---------------------- main menu list ---------------------------
  if(selectState==STATE_MENUSET){
    print_char(20,72,'S');
    print_char(31,72,'E');
    print_char(42,72,'T');
    print_char(53,72,' ');
    print_char(64,72,' ');
    print_char(75,72,' ');
    print_char(86,72,' ');
    print_char(97,72,' ');
  }
  else if(selectState==STATE_STOPWATCH){
    print_char(20,72,'S');
    print_char(31,72,'T');
    print_char(42,72,'O');
    print_char(53,72,'P');
    print_char(64,72,' ');
    print_char(75,72,' ');
    print_char(86,72,' ');
    print_char(97,72,' ');
  }
  else if(selectState==STATE_COUNTDOWN){
    print_char(20,72,'C');
    print_char(31,72,'O');
    print_char(42,72,'U');
    print_char(53,72,'N');
    print_char(64,72,'T');
    print_char(75,72,' ');
    print_char(86,72,' ');
    print_char(97,72,' ');
  }

  //---------------------- set menu list ----------------------------
  else if(selectState==STATE_SETTIME){
    print_char(20,72,'S');
    print_char(31,72,'E');
    print_char(42,72,'T');
    print_char(53,72,'>');
    print_char(64,72,'T');
    print_char(75,72,'I');
    print_char(86,72,'M');
    print_char(97,72,'E');
  }
}

/********************* Function in STATE_SETTIME ***************/
void loop_set_clock(){                                // func to set clock with loop
  bool setting = true;
  short settingClock[3];
  settingClock[0] = clock.hour;     
  settingClock[1] = clock.minute;   
  settingClock[2] = clock.second; 

  byte index = 0;
  while(setting){
    //---------------------- display set clock ----------------------------
    print_char(20, 72, settingClock[0] / 10 + '0');          
    print_char(31, 72, settingClock[0] % 10 + '0');
    print_char(42, 72, ':');
    print_char(53, 72, settingClock[1] / 10 + '0'); 
    print_char(64, 72, settingClock[1] % 10 + '0');
    print_char(75, 72, ':'); 
    print_char(86, 72, settingClock[2] / 10 + '0'); 
    print_char(97, 72, settingClock[2] % 10 + '0');
    delay(80);                                                  //delay display and debouncing 80 ms
    if(index == 0){
      print_char(20,72,' ');
      print_char(31,72,' ');
    }
    else if(index == 1){
      print_char(53,72,' ');
      print_char(64,72,' ');
    }
    else if(index == 2){
      print_char(86,72,' ');
      print_char(97,72,' ');
    }
    delay(40);                                                  //delay display and debouncing 40 ms

    //---------------------- get input ----------------------------------
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
      index++;                                                 // increase index for setting 
      if(index>2){
        index = 0;
      } 
    }
    if(digitalRead(BUTTON_BACK)==LOW){
      clock.hour = settingClock[0];                            // assign setting hour to main clock
      clock.minute = settingClock[1];                          // assign setting minute to main clock
      clock.second = settingClock[2];                          // assign setting second to main clock
      setting = false;                                         // set setting false to [exit] loop
      
      state.pop();                                             // pop top of <stack>state when go back state
      clear_display();
    }
  }
}
/********************* Function in STATE_STOPWATCH *************/
void loop_stopwatch(){                                 // func to run stopwatch with loop
  //------------- display stopwatch  ----------------------------------
  show_stopwatch();                                            // show stopwatch value
  
  unsigned long startMillis;
  //---------------------- get input ----------------------------------
  if(digitalRead(BUTTON_ENTER)==LOW){     
    delay(120);                                                // debouncing 120ms
    stopwatch.running = true;                                  // set stopwatch.running true for [enter] loop
    startMillis = millis();
  }
  while(stopwatch.running){
    stopwatch.millisec += millis()-startMillis;
    startMillis = millis();
    
    if(stopwatch.millisec >= 1000){
      stopwatch.millisec = stopwatch.millisec - 1000;
      stopwatch.second++;
    }
    if(stopwatch.second == 60){
      stopwatch.second = 0;
      stopwatch.minute++;
    }
    /*if minute >= 60 this stopwatch still run and display that minute such as minute at 71,12,99*/
    show_stopwatch();                                           // show stopwatch value again because value changed
    
    //---------------------- get input ----------------------------------
    if(digitalRead(BUTTON_ENTER)==LOW){
      delay(120);                                               // debouncing 120ms
      stopwatch.running = false;                                // set stopwatch.running false for [exit] loop
    }
  }

  //---------------------- get input ----------------------------------
  if(digitalRead(BUTTON_UP)==LOW && digitalRead(BUTTON_DOWN)==LOW){
    delay(120);                                                 // debouncing 120ms
    reset_stopwatch();
    show_stopwatch();
  }
  if(digitalRead(BUTTON_BACK)==LOW){
    delay(120);                                                 // debouncing 120ms
    state.pop();                                                // pop top of <stack>state when go back state
    clear_display();
  }
}
void show_stopwatch(){                                 // func to show stopwatch count on TFT   
  print_char(20, 72, stopwatch.minute / 10 + '0');               //print minute
  print_char(31, 72, stopwatch.minute % 10 + '0');
  
  print_char(53, 72, stopwatch.second / 10 + '0');               //print second
  print_char(64, 72, stopwatch.second % 10 + '0');
  
  print_char(86, 72, stopwatch.millisec / 100 + '0');            //print millisec
  print_char(97, 72, (stopwatch.millisec % 100)/10 + '0');

  if(stopwatch.second % 2 != 0){                                //print ':' with brink
    print_char(42, 72, ' ');
    print_char(75, 72, ' ');  
  }
  else{
    print_char(42, 72, ':');
    print_char(75, 72, ':');
  }
}
void reset_stopwatch(){                                 // func to reset stopwatch      
  stopwatch.minute = 0;
  stopwatch.second = 0;
  stopwatch.millisec = 0;
}

/********************* Function in STATE_COUNTDOWN *************/
void loop_countdown(){                                  // func to run countdown with loop
  //------------- display countdown  ----------------------------------
  show_countdown();                                             // show countdown value
  unsigned long startMillis;
  
  //---------------------- get input ----------------------------------
  unsigned long pressed;                                          
  if (digitalRead(BUTTON_ENTER) == LOW){                        // check when prees Enter
    pressed = millis();
    while(digitalRead(BUTTON_ENTER) == LOW && millis() - pressed < 1000){             //wait pressed Enter
    }

    if(millis() - pressed >= 1000){                                                   // if pressed Enter >= 1s
      loop_set_countdown();                                                           // [enter] loop to set start countdown time
    }
    else if(countdown.hour != 0 || countdown.minute != 0 || countdown.second != 0){   // if preesed Enter < 1s
      countdown.running = true;                                                       // set countdown.running true for [Enter] countdown loop
      startMillis = millis();                                                         // remember start millis() 
    }
  }
  
  
  while(countdown.running) {                                                          
    if (countdown.hour == 0 && countdown.minute == 0 && countdown.second == 0 && countdown.running == true) { 
      alert_countdown();                                                             
      countdown.running = false;
    }
    else{
      if(millis() - startMillis >= 1000) {
        startMillis = millis() + (1000 - (millis() - startMillis));
        countdown.second--;
      }
      if(countdown.second < 0){
        countdown.second = 59;
        countdown.minute--;
      }
      if(countdown.minute < 0){
        countdown.minute = 59;
        countdown.hour--;
      }
    }
    show_countdown();                                           // show countdown value again because value changed

    if(digitalRead(BUTTON_ENTER) == LOW){
      delay(120);                                               // debouncing 120ms
      countdown.running = false;                                // set countdown.running false for [Exit] countdown loop
    }
  }

  if(digitalRead(BUTTON_UP) == LOW && digitalRead(BUTTON_DOWN) == LOW){
    delay(120);                                                 // debouncing 120ms
    reset_countdown();                                          // reset stopwatch
    show_countdown();                                           // show countdown value again because value changed
  }
  if(digitalRead(BUTTON_BACK) == LOW){
    delay(120);                                                 // debouncing 120ms
    state.pop();                                                // pop top of <stack>state when go back state
    clear_display();
  }
}

void loop_set_countdown(){                             // func to set countdown with loop
  bool setting = true;
  short settingClock[3];
  settingClock[0] = countdown.hour;
  settingClock[1] = countdown.minute;
  settingClock[2] = countdown.second;

  byte index = 0;
  while(setting){
    //---------------------- display set countdown -----------------------
    print_char(20, 72, settingClock[0] / 10 + '0');
    print_char(31, 72, settingClock[0] % 10 + '0');
    print_char(42, 72, ':');
    print_char(53, 72, settingClock[1] / 10 + '0');
    print_char(64, 72, settingClock[1] % 10 + '0');
    print_char(75, 72, ':');
    print_char(86, 72, settingClock[2] / 10 + '0');
    print_char(96, 72, settingClock[2] % 10 + '0');
    delay(80);                                                  // delay display and debouncing 80 ms
    if(index == 0){
      print_char(20, 72, ' ');
      print_char(31, 72, ' ');
    }
    else if(index == 1){
      print_char(53, 72, ' ');
      print_char(64, 72, ' ');
    }
    else if(index == 2){
      print_char(86, 72, ' ');
      print_char(97, 72, ' ');
    }
    delay(40);                                                  // delay display and debouncing 40 ms

    //---------------------- get input ----------------------------------
    if(digitalRead(BUTTON_UP) == LOW){
      settingClock[index]++;
      if(settingClock[0] > 23){
        settingClock[0] = 0;
      }
      if(settingClock[1] > 59){
        settingClock[1] = 0;
      }
      if(settingClock[2] > 59){
        settingClock[2] = 0;
      }
    }
    if(digitalRead(BUTTON_DOWN) == LOW){
      settingClock[index]--;
      if(settingClock[0] < 0){
        settingClock[0] = 23;
      }
      if(settingClock[1] < 0){
        settingClock[1] = 59;
      }
      if(settingClock[2] < 0){
        settingClock[2] = 59;
      }
    }
    if(digitalRead(BUTTON_ENTER) == LOW){
      index++;
      if(index > 2){
        index = 0;
      }
    }
    if(digitalRead(BUTTON_BACK) == LOW){
      delay(120);                                               // debouncing 120ms
      countdown.hour = settingClock[0];                         // assign setcountdown hour to countdownclock
      countdown.minute = settingClock[1];                       // assign setcountdown minute to countdownclock
      countdown.second = settingClock[2];                       // assign setcountdown second to countdownclock
      setting = false;                                          // set setting false to [exit] loop
    }   
  }
}

void show_countdown(){
  print_char(20, 72, countdown.hour / 10 + '0');                 // print hour
  print_char(31, 72, countdown.hour % 10 + '0');

  print_char(53, 72, countdown.minute / 10 + '0');               // print minute
  print_char(64, 72, countdown.minute % 10 + '0');

  print_char(86, 72, countdown.second / 10 + '0');               // print second
  print_char(97, 72, countdown.second % 10 + '0');

  if(countdown.second % 2 != 0){                                // print ':' with brink
    print_char(42, 72, ' ');
    print_char(75, 72, ' ');
  }
  else{
    print_char(42, 72, ':');
    print_char(75, 72, ':');
  }
}

void alert_countdown(){                                 // func to action alert countdown end   
  lcd.fillScreen(RED);
  delay(100);
  lcd.fillScreen(GREEN);
  delay(100);
  lcd.fillScreen(BLUE);
  delay(100);
  lcd.fillScreen(BLACK);
}

void reset_countdown(){                                 // func to reset coundown
  countdown.hour = 0;
  countdown.minute = 0;
  countdown.second = 0;
}

/********************* Display *********************************/
void print_char(unsigned x ,unsigned y ,char c){
  lcd.fillRect(x,y,11,15,BLACK);
  lcd.drawChar(x,y,c,RED,2);
}

void clear_display(){
  //lcd.fillScreen(BLACK);
  lcd.fillRect(0,0,100,15,BLACK);
}
