#include<Wire.h>
#include<Adafruit_MCP4725.h>

Adafruit_MCP4725 dac;
int delay0;

#define defaultFreq  1700     //DAC speed
#define freqSine 500         // sine wave frequency

const int zetaLength = 8;
float zeta[zetaLength];
float s[zetaLength];
uint16_t s_dac[zetaLength];

void setup()
{
  dac.begin(0x64);
  delay0 = (1000000 / freqSine - 1000000 / defaultFreq) * zetaLength;   //[(Tsin - Tdac) /  zetaLength]
  Serial.begin(115200);
  Serial.print("delay0 is ");
  Serial.println(delay0);

  //Get Zeta
  for (int i = 0; i < zetaLength; i++) {
    zeta[i] = 360 / zetaLength * i;
  }

  //Make Sin(zeta) array
  for (int i = 0; i < zetaLength; i++)
  {
    float radianI = zeta[i] * PI / 180;
    s[i] = sin(radianI);

    // Map sin(zeta) dec to 12 bits
    s_dac[i] = (uint16_t)map(s[i] * 1000, -1000, 1000, 0, 4095);

    Serial.print("Sin(");
    Serial.print(zeta[i]);
    Serial.print(") = ");
    Serial.print(s[i]);
    Serial.print(" -> s_dac :");
    Serial.println(s_dac[i]);
  }
}

void loop()
{
  for (int i = 0; i < zetaLength; i++)
  {
    dac.setVoltage(s_dac[i], false);
    delayMicroseconds(delay0);
  }
}
