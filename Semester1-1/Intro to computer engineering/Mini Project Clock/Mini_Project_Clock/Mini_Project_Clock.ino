float timer1_start = 65473;     //second : 65535-62500 (+1) = 3035 (+1)   //millisecond : 65535-63 (+1) = 65472 (+1)
int millisec = 0;
int sec = 0;
int minute = 0;
int hour = 0;

void setup(){
  Serial.begin(9600);

  noInterrupts();
  TCCR1A = 0;
  TCCR1B = 0;

  TCNT1 = timer1_start;          
  TCCR1B = TCCR1B|(1 << CS12);  
  TIMSK1 = TIMSK1|(1 << TOIE1); 
  interrupts();
}

void loop(){
  Serial.print(hour);
  Serial.print(" : ");
  Serial.print(minute);
  Serial.print(" : ");
  Serial.print(sec);
  Serial.print(" : ");
  Serial.println(millisec); 
}

ISR(TIMER1_OVF_vect) // interrupt service routine
{
  TCNT1 = timer1_start;                   // preload timer
  millisec++;
  if(millisec==1000){
    millisec = 0;
    sec++;
  }
  if(sec==60){
    sec = 0;
    minute++;
  }
  if(minute==60){
    minute = 0;
    hour++;
  }
}
