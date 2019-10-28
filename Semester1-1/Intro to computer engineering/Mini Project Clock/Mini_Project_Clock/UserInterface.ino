/************** User Interface **********************/
void show_selectstate(){
  if(selectState==STATE_MENUSET){
    print_char(2,1,'S');
    print_char(6,1,'E');
    print_char(10,1,'T');
    print_char(14,1,' ');
    print_char(18,1,' ');
  }
  else if(selectState==STATE_STOPWATCH){
    print_char(2,1,'S');
    print_char(6,1,'T');
    print_char(10,1,'O');
    print_char(14,1,'P');
    print_char(18,1,' ');
  }
  else if(selectState==STATE_COUNTDOWN){
    print_char(2,1,'C');
    print_char(6,1,'O');
    print_char(10,1,'U');
    print_char(14,1,'N');
    print_char(18,1,'T');
  }

  
  else if(selectState==STATE_SETTIME){
    print_char(2,1,'S');
    print_char(6,1,'E');
    print_char(10,1,'T');
    
    plot(14,2,true);
    plot(14,3,true);
    plot(14,4,true);
    plot(15,3,true);

    print_char(17,1,'T');
    print_char(21,1,'I');
    print_char(25,1,'M');
    print_char(29,1,'E');
  }
  else if(selectState==STATE_SETALARM){
    print_char(2,1,'S');
    print_char(6,1,'E');
    print_char(10,1,'T');
    
    plot(14,2,true);
    plot(14,3,true);
    plot(14,4,true);
    plot(15,3,true);
    
    print_char(17,1,'A');
    print_char(21,1,'L');
    print_char(25,1,'R');
    print_char(29,1,'M');
  }
}
void selector_state(byte startstate, byte endstate){
  if(selectState<=startstate){
    selectState = startstate+1;
  }
  else if(selectState>=endstate){
    selectState = endstate-1;
  }
  
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
    delay(120);
    state.pop();
    selectState = state.peek();
    clear_display();
  }
}
