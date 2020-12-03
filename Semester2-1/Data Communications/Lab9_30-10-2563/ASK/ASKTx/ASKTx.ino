#include <Wire.h>
#include <Adafruit_MCP4725.h>

Adafruit_MCP4725 dac;

#define defaultFreq 1700                 // DAC speed (Hz) for 1 cycle wave
#define freqSine 1000                    // freqSine : frequency of carrier sine wave (Hz)

int delay0;

const int zetaLength = 4;
float zeta[zetaLength];
float s[zetaLength];
uint16_t s_dac[zetaLength];

const float A[4] = {1,2,3,4};            // A[00]-A[11] : ASK Amplitude (0,5] (V)
const int cyclePerBaud = 5;              // Number of cycle/baud

char inData[20];                         // Allocate some space for the string

void setup( ) {
  dac.begin(0x64);
  Serial.begin(115200);
  
  delay0 = (1000000/freqSine - 1000000/defaultFreq) / zetaLength;     //[(Tsin - Tdac) / zetaLength]
  
  Serial.print("delay0 is ");
  Serial.println(delay0);
  
  /*Get Zeta*/
  for (int i = 0; i < zetaLength; i++) {
    zeta[i] = 360 / zetaLength * i;
  }
  
  /*Make Sin(zeta) array*/
  for (int i = 0; i < zetaLength; i++)
  {
    float radianI = zeta[i] * PI / 180;
    s[i] = sin(radianI);

    /* Map sin(zeta) dec to 12 bits */
    s_dac[i] = (uint16_t)map(s[i] * 1000, -1000, 1000, 0, 4095);

    Serial.print("Sin(");
    Serial.print(zeta[i]);
    Serial.print(") = ");
    Serial.print(s[i]);
    Serial.print(" -> s_dac :");
    Serial.println(s_dac[i]);
  }

  Serial.flush();                         // for clear buffer serial
}
void loop( ) {
  if (Serial.available() > 0) {
    /*use a cycle loop receive inData : message input */
    for (int i = 0; i == 0 || inData[i - 1] != 0xFFFFFFFF; i++) {
      inData[i] = Serial.read();          // Read a character
    }

    /*use a cycle loop i for send data 8 bits*/
    for (int i = 0; inData[i] != 0xFFFFFFFF; i++ ) {
      /*use a cycle loop k for 1 ASK signal element (2 bit)
        - map inData[i] to tmp (2 bit)
        - from LSB to MSB*/
      for (int k = 7; k >= 0; k -= 2) {
        int tmp = inData[i] & 3;          // 00, 01, 10, 11
        /*use a cycle loop sl to send 5 cycle/baud*/
        for (int sl = 0; sl < cyclePerBaud; sl++ ) {
          /*use a cycle loop s to send [zetaLength] sample/cycle*/
          for (int sl = 0; sl < zetaLength; sl++ ) {
            /*Use the selected amplitude above to modify
              sine amplitude*/
            dac.setVoltage(s_dac[sl]*A[tmp]/5, false);
            delayMicroseconds(delay0);    // sampling delay
          }
        }
        inData[i] >>= 2;
      }
    }
    dac.setVoltage(0, false);             // for don't send
  }
}
