void setup() {
  Serial.begin(9600);
}

void loop() {
  Serial.print("Analogread_potetntiometer => ");
  Serial.println(analogRead(A3));
}
