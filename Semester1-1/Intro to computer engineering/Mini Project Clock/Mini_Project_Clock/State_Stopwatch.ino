/************** Stopwatch State *************************/
void loop_stopwatch(){
  show_stopwatch();
  
  unsigned long startMillis;
  if(digitalRead(BUTTON_ENTER)==LOW){
    delay(120);                                                //Debouncing 120ms
    stopwatch.running = true;
    startMillis = millis();
  }
  while(stopwatch.running){
    stopwatch.millisec += millis()-startMillis;
    startmillis = millis();
    
    if(stopwatch.millisec >= 1000){
      stopwatch.millisec = stopwatch.millisec - 1000;
      stopwatch.second++;
    }
    if(stopwatch.second == 60){
      stopwatch.second = 0;
      stopwatch.minute++;
    }
    /*if minute >= 60 this stopwatch still run and display that minute*/
    
    show_stopwatch();
    
    if(digitalRead(BUTTON_ENTER)==LOW){
      delay(120);                                               //Debouncing 120ms
      stopwatch.running = false;
    }
  }
  
  if(digitalRead(BUTTON_UP)==LOW && digitalRead(BUTTON_DOWN)==LOW){
    delay(120);                                                 //Debouncing 120ms
    reset_stopwatch();
    show_stopwatch();
  }
  if(digitalRead(BUTTON_BACK)==LOW){
    delay(120);                                                 //Debouncing 120ms
    state.pop();
    clear_display();
  }
}
void show_stopwatch(){
  print_char( 2, 1, stopwatch.minute / 10 + '0');             //print minute
  print_char( 6, 1, stopwatch.minute % 10 + '0');
  
  print_char(12, 1, stopwatch.second / 10 + '0');             //print second
  print_char(17, 1, stopwatch.second % 10 + '0');
  
  print_char(23, 1, stopwatch.millisec / 100 + '0');           //print second
  print_char(27, 1, (stopwatch.millisec % 100)/10 + '0');

  if(stopwatch.second % 2 != 0){                              //print ':' with brink
    print_char( 9, 1, ' ');
    print_char( 20, 1, ' ');  
  }
  else{
    print_char( 9, 1, ':');
    print_char( 20, 1, ':');
  }
}
void reset_stopwatch(){
  stopwatch.minute = 0;
  stopwatch.second = 0;
  stopwatch.millisec = 0;
}
