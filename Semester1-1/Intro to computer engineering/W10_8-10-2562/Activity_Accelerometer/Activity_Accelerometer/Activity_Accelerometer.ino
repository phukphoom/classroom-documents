void setup(){
  analogWrite(A1,1024); //VCC
  analogWrite(A5,0);    //GND
  Serial.begin(9600);
}
void loop(){
  int xaccel = analogRead(A2);
  int yaccel = analogRead(A3);
  int zaccel = analogRead(A4);
 
  Serial.print("X -> ");
  Serial.print(xaccel));

  Serial.print("\tY -> ");
  Serial.print(yaccel);

  Serial.print("\tZ -> ");
  Serial.println(zaccel));

  delay(100);
}
