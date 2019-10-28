/************** Initialization **********************/
void initPin(){
  pinMode(BUTTON_BACK,INPUT_PULLUP);
  pinMode(BUTTON_UP,INPUT_PULLUP);
  pinMode(BUTTON_DOWN,INPUT_PULLUP);
  pinMode(BUTTON_ENTER,INPUT_PULLUP);
  pinMode(BUZZER_PIN,OUTPUT);
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
  byte devices = lc.getDeviceCount();
  for(byte address=0; address<devices; address++){
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}
void initState(){
  state.push(STATE_HOME);
}
