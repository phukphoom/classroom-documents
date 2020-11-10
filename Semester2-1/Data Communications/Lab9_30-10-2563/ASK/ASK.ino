#include <Wire.h>
#include <Adafruit_MCP4725.h>
Adafruit_MCP4725 dac;

#define defaultFreq 1700 //DAC speed (Hz)
/*freq0 : frequency of carrier sine wave (Hz)*/
#define freq0 3400

/*A[0]-A[3] : ASK Amplitude (0,5] (V)*/
const float A[4] = {2,3,4,5};
/*S_DAC : Amplitude (12bit) of sine wave at 0,90,180,270*/
const uint16_t S_DAC[4] = {0x0000, 0x0FFF, 0x0000, 0x0FFF};
int delay0;
char inData[20]; // Allocate some space for the string

void setup( ) {
  /* set buadrate serial is 115200 */
  dac.begin(0x62); // set to default
  delay0 = (1000000 / freq0 - 1000000 / defaultFreq) / 4;
  // delay for sampling period of sine
  // (Tsine – delayfrom DAC processing speed)
  Serial.flush(); // for clear buffer serial
}

void loop( ) {
  if (Serial.available() > 0) {
    for (int i = 0; i == 0 || inData[i - 1] != 0xFFFFFFFF; i++) {
      inData[i] = Serial.read(); // Read a character
    }
    for (int i = 0; inData[i] != 0xFFFFFFFF; i++ ) {
      for (int k = 7; k >= 0; k -= 2) {
        int tmp = inData[i] & 3; // 00, 01, 10, 11
        for (int sl = 0; sl < 20; sl++ ) {
          for (int sl = 0; sl < 20; sl++ ) {
            dac.setVoltage(S_DAC[sl % 4]*A[tmp] / 4, false);
            delayMicroseconds(delay0); // sampling delay
          }
        }
        inData[i] >>= 2;
      }
    }
    dac.setVoltage(0, false); // for don't send
  }
}
