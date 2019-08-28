int n_LED;
void setup() {
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  n_LED = 9;
}

void loop() {
  digitalWrite(n_LED,HIGH);
  delay(500);
  
  n_LED++;
  if(n_LED==13){
    n_LED = 9;
    for(int i=9;i<=12;i++){
      digitalWrite(i,LOW);
    }
    delay(500);
  }                                                                                                                                                                                                                                     
}
