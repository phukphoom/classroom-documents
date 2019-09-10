void sincos();
void triangle();
void sawtooth();
void squre();

void setup() {
  Serial.begin(9600);
}

void loop(){
  //sincos();
  //sawtooth();
  triangle();
  //squre();
}

//-----------------------function---------
void sincos(){
  float angle=0;
  for(angle=0;angle<=90;angle=angle+0.1)
  {
    float sina=sin(angle);
    float cosa=cos(angle);
    Serial.print(sina);
    Serial.print(" ");
    Serial.println(cosa);
    delay(1);
  }
}
void triangle(){
  float x = -1;
  while(x<=1){
    float y = abs(x-2)-2;
    Serial.println(y);
    delay(100);
    x = x + 0.1;
  }
  while(x>=-1){
    float y = abs(x-2)-2;
    Serial.println(y);
    delay(100);
    x = x - 0.1;
  }
}
void sawtooth() {
  float y = -1;
  float x = 0;

  while(x<=1){
    y = y + 0.2;
    Serial.println(y);
    delay(1);
    x = x + 0.1;
  }   
}
void squre(){
  for(int i=0;i<10;i++){
    Serial.println(1);  
  }
  for(int i=0;i<10;i++){
    Serial.println(0);  
  }
}
//----------------------------------------
