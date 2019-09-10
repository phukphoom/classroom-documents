#define analogLDR A3
#define digitalLDR 5

void setup() {
  pinMode(analogLDR,INPUT);
  pinMode(digitalLDR,INPUT);
  Serial.begin(9600);
}

void loop() {
 Serial.print("AnalogReadLDR=> ");
 Serial.print(analogRead(analogLDR));
 Serial.print("|| DigitalReadLDR=> ");
 Serial.println(digitalRead(digitalLDR));
}
