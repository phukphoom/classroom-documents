float zeta[4] = {0,PI/2,PI,3*PI/2};
float s[4];
uint16_t pwmDuty[4];

void setup() {
  Serial.begin(115200);
  pinMode(3,OUTPUT);
  for(int i=0;i<4;i++){
    s[i] = sin(zeta[i]);
    pwmDuty[i] = (s[i]*100)+155;
  }
}

void loop() {
  for(int i=0;i<4;i++){
    analogWrite(3,pwmDuty[i]);
    delayMicroseconds(4000);
  }
}
