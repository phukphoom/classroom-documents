const int zetaLength = 16;
float zeta[zetaLength];
float s[zetaLength];
uint16_t pwmDuty[zetaLength];
int pwmPin = 3; //PWM choices:3, 5, 6, 9, 10, 11

void setup()
{
  pinMode(pwmPin, OUTPUT);
  pinMode(pwmPin2, OUTPUT);
  Serial.begin(115200);
  
  //Get Zeta
  for (int i = 0; i < zetaLength; i++) {
    zeta[i] = 360 / zetaLength * i;
    Serial.println(zeta[i]);
  }

  //Make Sin(zeta) array
  for (int i = 0; i < zetaLength; i++)
  {
    float radianI = zeta[i] * PI / 180;
    s[i] = sin(radianI);

    // Map sin(zeta) dec to 8 bits
    pwmDuty[i] = (uint16_t)map(s[i] * 1000, -1000, 1000, 0, 255);
    
    Serial.print(i);
    Serial.print(": ");
    Serial.print(s[i]);
    Serial.print(" ");
    Serial.println(pwmDuty[i]);
  }
}

void loop()
{
  for (int i = 0; i < zetaLength; i++)
  {
    //Serial.println(pwmDuty[i]);
    analogWrite(pwmPin, pwmDuty[i]);
    delayMicroseconds(4000);
  }
}
