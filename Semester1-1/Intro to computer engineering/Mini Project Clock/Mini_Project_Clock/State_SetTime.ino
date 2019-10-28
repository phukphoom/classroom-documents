/************** Set time State **************************/
void loop_set_clock(){
  bool setting = true;
  byte settingClock[3];
  settingClock[0] = clock.hour;     
  settingClock[1] = clock.minute;   
  settingClock[2] = clock.second; 

  byte index = 0;
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
    delay(80);                                                //Delay display and Debouncing 80 ms
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
