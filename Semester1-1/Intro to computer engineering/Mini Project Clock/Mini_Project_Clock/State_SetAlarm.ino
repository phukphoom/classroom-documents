/************** Set Alarm State *************************/
void loop_set_alarm(){
  show_alarm_enable_bar();
  
  bool setting = true;
  byte settingClock[3];
  settingClock[0] = alarmclock.hour;     
  settingClock[1] = alarmclock.minute;   
  settingClock[2] = alarmclock.second; 

  byte index = 0;
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
    delay(80);                                                 //Delay display and Debouncing 80 ms
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
    delay(40);                                                 //Delay display and Debouncing 40 ms
    
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
      unsigned long pressed = millis();
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
  for(byte x=2;x<30;x++){
    plot(x,7,alarmclock.enable);
  }
}
void alert_alarm(){
  fade_up();
  tone(BUZZER_PIN,millis()%100);
  
  delay(200);
  
  fade_down();
  noTone(BUZZER_PIN);
}
