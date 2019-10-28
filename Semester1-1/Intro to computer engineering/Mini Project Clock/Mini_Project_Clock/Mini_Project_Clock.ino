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

#define BUZZER_PIN    5
//---------------------------------------------------------------------- Variable Setup -----------------------
LedControl lc = LedControl(11,13,10,4);
byte ledIntensity = 8;

enum{
  STATE_HOME = 0,
  STATE_MENUMAIN,
  
  START_MAIN_STATE,
    STATE_MENUSET,
    STATE_STOPWATCH,
    STATE_COUNTDOWN,
  END_MAIN_STATE,
  
  START_SUB_STATE_SET,
      STATE_SETTIME,
      STATE_SETALARM,
  END_SUB_STATE_SET,
};
StackArray<byte> state;
byte selectState = STATE_HOME;

struct Clock{
  byte hour = 0;
  byte minute = 0;
  byte second = 0;
}clock;
struct Alarmclock{
  byte hour = 0;
  byte minute = 0;
  byte second = 0;
  bool enable = false;
}alarmclock;
struct Stopwatch{
  byte minute = 0;
  byte second = 0;
  unsigned millisec = 0;
  bool running = false;
}stopwatch;
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
  unsigned currentState = state.peek(); 
  /*Serial.print("Now State : ");
  Serial.print(state.peek());
  Serial.print(" -> selector State : ");
  Serial.println(selectState);*/
//------------  
  if(currentState == STATE_HOME){           /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_BACK*/
    show_clock();
    show_alarm_enable_bar();
    
    set_intensity();
    if(digitalRead(BUTTON_BACK)==LOW){
      delay(120);                           //debouncing 120ms
      state.push(STATE_MENUMAIN);
      clear_display();
    }

    if(alarmclock.enable){
      if(clock.hour == alarmclock.hour && clock.minute == alarmclock.minute){
        alert_alarm();
        if(clock.second==59 || digitalRead(BUTTON_ENTER)==LOW){
          alarmclock.enable = false;
        }
      }
    }
  } 
//------------  
  else if(currentState == STATE_MENUMAIN){       /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    selector_state(START_MAIN_STATE,END_MAIN_STATE);
  }
  else if(currentState == STATE_MENUSET){
    selector_state(START_SUB_STATE_SET,END_SUB_STATE_SET);
  }
//------------ 
  else if(currentState == STATE_SETTIME){   /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    loop_set_clock();
  }
//------------ 
  else if(currentState == STATE_SETALARM){  /*input : BUTTON_UP, BUTTON_DOWN, BUTTON_ENTER, BUTTON_BACK*/
    loop_set_alarm();
  }
//------------ 
  else if(currentState == STATE_STOPWATCH){
    loop_stopwatch();
  }
//------------ 
  else if(currentState == STATE_COUNTDOWN){
    
  }
}
//--------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------- User Define Func ---------------------
