#define port1 12
#define port2 11
#define port3 10

void setup() {
}

void loop() {
  pinMode(port1,OUTPUT);
  pinMode(port2,OUTPUT);
  pinMode(port3,INPUT);
  
  digitalWrite(port1,LOW);
  digitalWrite(port2,HIGH);
  delay(1000);
  
  digitalWrite(port1,HIGH);
  digitalWrite(port2,LOW);
  delay(1000);
//------------------------------------------------
  pinMode(port1,INPUT);
  pinMode(port2,OUTPUT);
  pinMode(port3,OUTPUT);

  digitalWrite(port2,LOW);
  digitalWrite(port3,HIGH);
  delay(1000);

  digitalWrite(port2,HIGH);
  digitalWrite(port3,LOW);
  delay(1000);
//-----------------------------------------------
  pinMode(port1,OUTPUT);
  pinMode(port2,INPUT);
  pinMode(port3,OUTPUT);

  digitalWrite(port1,LOW);
  digitalWrite(port3,HIGH);
  delay(1000);

  digitalWrite(port1,HIGH);
  digitalWrite(port3,LOW);
  delay(1000);
}
