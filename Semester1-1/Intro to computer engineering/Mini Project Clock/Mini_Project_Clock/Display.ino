/************** Display *********************************/
void plot(unsigned x ,unsigned y ,bool value){
  byte address;
  if(x >= 0 && x <= 7){
    address = 3;
  }
  if(x >= 8 && x <= 15){
    address = 2;
    x = x - 8;
  }
  if(x >= 16 && x <= 23){
    address = 1;
    x = x - 16;
  }
  if(x >= 24 && x <= 34){
    address = 0;
    x = x - 24;
  }

  lc.setLed(address,y,x,value);
}
void print_char(unsigned x ,unsigned y ,char c){
  unsigned dots;
  if (c >= 'A' && c <= 'Z' || (c >= 'a' && c <= 'z') ) { c &= 0x1F; }   // A-Z maps to 1-26 
  else if (c >= '0' && c <= '9') { c = (c - '0') + 32; }
  else if (c == ' ') { c = 0;  }                                        // space 
  else if (c == '.') { c = 27; }                                        // full stop 
  else if (c == ':') { c = 28; }                                        // colon 
  else if (c == '\''){ c = 29; }                                        // single quote mark 
  else if (c == '!') { c = 30; }                                        // single quote mark 
  else if (c == '?') { c = 31; }                                        // single quote mark 

  for (uint8_t col = 0; col < 3; col++) {
    dots = pgm_read_byte_near(&mytinyfont[c][col]);
    for (uint8_t row = 0; row < 5; row++) {
      if (dots & (16 >> row))
        plot(x + col, y + row, true);
      else
        plot(x + col, y + row, false);
    }
  }
}
void set_intensity(){
  if(digitalRead(BUTTON_UP)==LOW){
    ledIntensity++;
  }
  else if(digitalRead(BUTTON_DOWN)==LOW){
    ledIntensity--;
  }

  if(ledIntensity<0){
    ledIntensity = 0;
  }
  else if(ledIntensity>15){
    ledIntensity = 15;
  }
  
  for(byte address=0; address<4; address++){
    lc.setIntensity(address,ledIntensity);
  }
}
void fade_up(){
  for(byte i=0;i<ledIntensity;i++){
    for(byte address=0;address<4;address++){
      lc.setIntensity(address,i);
    }
  }
}
void fade_down(){
  for(byte i=ledIntensity;i>=0;i--){
    for(byte address=0;address<4;address++){
      lc.setIntensity(address,i);
    }
  }
}
void clear_display(){
  for(byte address=0; address<4; address++){
    lc.clearDisplay(address);
  }
}
