/////////////////////////// #define /////////////////////////////////
#define BUTTON_MODE  3
#define BUTTON_UP    7
#define BUTTON_DOWN  8
#define BUTTON_ENTER 9
////////////////////////////////////////////////////////////////////

/////////////////////////// Setup Variable /////////////////////////
float timer1_start = 3036;            // second : 65535-62500 (+1) = 3035 (+1) , millisecond : 65535-63 (+1) = 65472 (+1)*/

enum{
  mode_setclock = 0,
  mode_clock,
  mode_stopwatch,
  mode_countdown,
};
unsigned mode = mode_setclock;

int pressed_timer;
bool pressed_mode_button = false;

struct Clock{
  unsigned second;
  unsigned minute;
  unsigned hour;
}clock;

struct Stopwatch{
  unsigned millisec;
  unsigned second;
  unsigned minute;
}stopwatch;

struct Countdown{
  unsigned second;
  unsigned minute;
  unsigned hour;
}countdown;
////////////////////////////////////////////////////////////////////

/////////////////////////// Interrupt service routine //////////////
ISR(TIMER1_OVF_vect)                  //<-- Main Clock timer              
{
  TCNT1 = timer1_start;               // preload timer
  Clock.second++;
  if(clock.second==60){
    clock.second = 0;
    clock.minute++;
  }
  if(clock.minute==60){
    clock.minute = 0;
    clock.hour++;
  }
}
////////////////////////////////////////////////////////////////////

/////////////////////////// Main Programe //////////////////////////
void setup(){
  pinMode(BUTTON_MODE,INPUT_PULLUP);
  pinMode(BUTTON_UP,INPUT_PULLUP);
  pinMode(BUTTON_DOWN,INPUT_PULLUP);
  pinMode(BUTTON_ENTER,INPUT_PULLUP);
  
  Serial.begin(9600);

  //--------- Timer 1 setup ----------------
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = timer1_start;          
  TCCR1B = TCCR1B|(1 << CS12);  
  TIMSK1 = TIMSK1|(1 << TOIE1); 
  interrupts();
  //----------------------------------------
}

void loop(){
  select_mode();

  if(mode == mode_setclock){
    setclock();
  }
  }
  else if(mode == mode_clock){
    show_clock();
  }
  else if(mode == mode_stopwatch){
  }
  else if(mode == mode_countdown){
  }
  
}
////////////////////////////////////////////////////////////////////

/////////////////////////// User Define Function ///////////////////
void select_mode(){
  if(digitalRead(BUTTON_MODE)==LOW &&  pressed_mode_button == false){
    pressed_timer = millis();
    pressed_mode_button = true;
    mode++;
    if(mode == 4){
      mode = 0;
    }
    
    //----------------Show Mode-------------
    if(mode == mode_setclock){
      Serial.println("Mode_SetClock");
    }
    else if(mode == mode_clock){
      Serial.println("Mode_Clock");
    }
    else if(mode == mode_stopwatch){
      Serial.println("Mode_Stopwatch");
    }
    else if(mode == mode_countdown){
      Serial.println("Mode_Countdown");
    }
    //---------------------------------------
   }
   delay(500);
  if(millis()-pressed_timer>=500){
    pressed_mode_button =false;
    Serial.println(millis());
  }
}

void show_clock(){
  Serial.print(clock.hour);
  Serial.print(" : ");
  Serial.print(clock.minute);
  Serial.print(" : ");
  Serial.println(clock.second);
}
void show_setclock(){
  Serial.print(setclock.hour);
  Serial.print(" : ");
  Serial.print(setclock.minute);
  Serial.print(" : ");
  Serial.println(setclock.second);
}
void show_stopwatch(){
  Serial.print
}
void show_countdown(){
  
}

void setclock(){
  bool exit_mode = false;
  
  /*set clock only hour and minute*/
  int setclock[2];
  int setclock[0] = clock.hour;
  int setclock[1] = clock.minute;

  int i = 0;
  while(!exit_mode){
    if(digitalRead(BUTTON_MODE)==LOW){
      exit_mode = true;
    }
    
    if(digitalRead(BUTTON_UP)==LOW){
      setclock[i]++;
      if(setclock[0]>=24){
        setclock[0] = 0;
      }
      if(setclock[1]>=60){
        setclock[1] = 0;
      }
    }
    if(digitalRead(BUTTON_DOWN)==LOW){
      setclock[i]--;
      if(setclock[0]<=0){
        setclock[0] = 23;
      }
      if(setclock[1]<=0){
        setclock[1] = 59;
      }
    }
    
    if(digitalRead(BUTTON_ENTER)==LOW){
        i++;
        if(i>=2){
          i = 0;
        } 
  }

  clock.hour = setclock[0];
  clock.minute = setclock[1];
}
