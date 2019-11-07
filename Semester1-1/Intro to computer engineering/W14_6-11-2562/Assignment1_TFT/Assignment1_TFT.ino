#include "ST7735_TEE.h"
//////////////////////////////////////////////////////////////////////// Variable Setup ////////////////////////////////////////////////////////////////////////
TEE_ST7735 lcd(9, 10, 11, 12, 13);              // pin  CSK,SDA,A0,RST,CS

struct Clock{                                   // create clock,buffclock                            
  byte hour = 0;
  byte minute = 0;
  byte second = 0;
}clock,buffclock;

struct Date{                                    // create date,buffdate
  char *day;
  byte date = 1;
  byte month = 1;
  short year = 1;
}date,buffdate;

char day[7][3]={"MON","TUE","WED","THU","FRI","SAT","SUN"};              // create day name list
uint16_t daycolor[7] ={0xFFE0,0xF81F,0x7E0,0xFBE0,0x1F,MAGENTA,RED};     // create day color list
int indexday;                                   // create [variable] indexday to point current day

bool initstate_clock = true;
bool initstate_date = true;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Interrupt Service Routine /////////////////////////////////////////////////////////////
float timer1_start = 3036;                      // timer start point #second : 65535-62500 (+1) = 3035 (+1))
ISR(TIMER1_OVF_vect)                            // main timer <core of this product>              
{
  TCNT1 = timer1_start;                         // preload timer
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
    date.date++;
    indexday++;
    if(indexday == 7){
      indexday = 0;
    }
    date.day = day[indexday];
  }
  if(date.month == 1 && date.date == 32 ||
    date.month == 2 && date.date == 29 && date.year%4!=0 || date.month == 2 && date.date == 30 && date.year%4 == 0 ||
    date.month == 3 && date.date == 32 ||
    date.month == 4 && date.date == 31 ||
    date.month == 5 && date.date == 32 ||
    date.month == 6 && date.date == 31 ||
    date.month == 7 && date.date == 32 ||
    date.month == 8 && date.date == 32 ||
    date.month == 9 && date.date == 31 ||
    date.month == 10 && date.date == 32 ||
    date.month == 11 && date.date == 31 ||
    date.month == 12 && date.date == 32){
    date.date = 1;
    date.month++;
  }
  if(date.month == 13){
    date.month = 1;
    date.year++;
  }
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Setup Program /////////////////////////////////////////////////////////////////////////
void setup(){ 
  initTimer();
  initLcd();
  initTimeDate();
  initDecoration();
  
  Serial.begin(9600);
  Serial.println("Set Date & Time by below syntax");
  Serial.println("indexday[1-7][mon-sun]|date.month.year|hour,minute,second");
  Serial.println("Example >> 3|29.03.2000|10.10.00");
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// Main Program //////////////////////////////////////////////////////////////////////////
void loop(){
  //---------------------------- show display on TFT ----------------------------------------//
  show_clock();
  show_date();
  //-----------------------------------------------------------------------------------------//
  //---------------------------- input for set time & date ----------------------------------//
  int bufferRead[22];
  int bufferIndex = 0;
  int inputStatus = false;
  while(Serial.available()){
    bufferRead[bufferIndex] = Serial.read()-'0';
    if(bufferRead[bufferIndex]!='\n'-'0'){
      bufferIndex++;
    }
    else{
      bufferIndex = 0;
      inputStatus = true;
    }
  }
  //-----------------------------------------------------------------------------------------//
  //---------------------------- assige value to time & date --------------------------------//
  if(inputStatus == true){
    inputStatus = false;
    
    indexday = bufferRead[0] - 1;
    date.day = day[indexday];
    
    date.date = bufferRead[2]*10 + bufferRead[3];
    date.month = bufferRead[5]*10 + bufferRead[6];
    date.year = bufferRead[8]*1000 + bufferRead[9]*100 + bufferRead[10]*10 + bufferRead[11];
    
    clock.hour = bufferRead[13]*10 + bufferRead[14];
    clock.minute = bufferRead[16]*10 + bufferRead[17];
    clock.second = bufferRead[19]*10 + bufferRead[20] ;
  }
  //-----------------------------------------------------------------------------------------//
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////// User Define Func //////////////////////////////////////////////////////////////////////
/********************* Initialization **************************/
void initTimer(){                                     // func to set initTimer1
  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;
  TCNT1 = timer1_start;          
  TCCR1B = TCCR1B|(1 << CS12);  
  TIMSK1 = TIMSK1|(1 << TOIE1); 
  interrupts();
}
void initLcd(){                                       // func to set initLcd
  lcd.init(lcd.VERTICAL);
  clear_display();
}
void initTimeDate(){                                  // func to set initTimeDate
  clock.hour = 0;
  clock.minute = 0;
  clock.second = 0;
  
  indexday = 0;
  date.day = day[indexday]; 
  date.date = 1;
  date.month = 1;
  date.year = 1;
}
void initDecoration(){                                // function to set initDecoration
  lcd.drawString(35,150,"Created by RsPP",CYAN,1);
  lcd.drawCircle(64,80,52,RED);
}
/********************* Show ***********************************/
void show_clock(){                                      // func to show mainclock count on TFT
  if(clock.hour!=buffclock.hour || initstate_clock){
    print_char( 27, 60, clock.hour / 10 + '0',2,WHITE);                   // print hour 
    print_char( 40, 60, clock.hour % 10 + '0',2,WHITE);
  }

  lcd.drawChar(49,60,':',WHITE,2);
  
  if(clock.minute!=buffclock.minute || initstate_clock){
    print_char( 58, 60, clock.minute / 10 + '0',2,WHITE);                 // print minute
    print_char( 71, 60, clock.minute % 10 + '0',2,WHITE);
  }
  
  if(clock.second!=buffclock.second || initstate_clock){
    print_char( 89, 73, clock.second / 10 + '0',1,WHITE);                 // print second
    print_char( 97, 73, clock.second % 10 + '0',1,WHITE);
  }

  initstate_clock = false;
  buffclock.hour=clock.hour;
  buffclock.minute=clock.minute;
  buffclock.second=clock.second;
}
void show_date(){                                        // func to show date on TFT
  if(date.day!=buffdate.day || initstate_date){
    print_char( 60, 90, date.day[0],3,daycolor[indexday]);                 // print day name
    print_char( 77, 90, date.day[1],3,daycolor[indexday]);
    print_char( 94, 90, date.day[2],3,daycolor[indexday]);
  }
  
  if(date.date!=buffdate.date || initstate_date){
    print_char( 20, 90, date.date / 10 + '0',1,WHITE);                     // print date
    print_char( 28, 90, date.date % 10 + '0',1,WHITE);
  }
  
  lcd.drawChar(36,90,'/',WHITE,1);
  
  if(date.month!=buffdate.month || initstate_date){
    print_char( 44, 90, date.month / 10 + '0',1,WHITE);                    // print month
    print_char( 52, 90, date.month % 10 + '0',1,WHITE);
  }

  if(date.year!=buffdate.year || initstate_date){
    print_char( 28, 104, date.year / 1000 + '0',1,WHITE);                  // print year
    print_char( 36, 104, (date.year % 1000) / 100 + '0',1,WHITE);
    print_char( 44, 104, (date.year % 100) / 10 + '0',1,WHITE);
    print_char( 52, 104, (date.year % 10) + '0',1,WHITE);
  }

  initstate_date = false;
  buffdate.day = date.day;
  buffdate.date = date.date;
  buffdate.month = date.month;
  buffdate.year = date.year;
}
/********************* Display *********************************/
void print_char(unsigned x ,unsigned y ,char c ,int fontsize ,uint16_t color){
  lcd.fillRect(x,y,fontsize*5,fontsize*7,BLACK);
  lcd.drawChar(x,y,c,color,fontsize);
}
void clear_display(){
  lcd.fillScreen(BLACK);
}
