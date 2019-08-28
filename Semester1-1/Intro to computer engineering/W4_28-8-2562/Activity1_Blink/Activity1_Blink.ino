int LED_pin;
void setup() {
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  LED_pin = 9;
}

void loop() {
  digitalWrite(LED_pin,HIGH);
  delay(500);
  
  LED_pin++;
  if(LED_pin==13){
    LED_pin = 9;
    for(int i=9;i<=12;i++){
      digitalWrite(i,LOW);
    }
    delay(500);
  }                                                                                                                                                                                                                                     
}
