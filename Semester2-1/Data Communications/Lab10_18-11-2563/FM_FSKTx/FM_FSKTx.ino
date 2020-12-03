#include <Wire.h>
#include <Adafruit_MCP4725.h>

Adafruit_MCP4725 dac;

#define defaultFreq 1700                  // DAC speed (Hz) for 1 cycle wave
#define f0 200                            // FSK f0 frequency of carrier sine wave (Hz)
#define f1 500                            // FSK f1 frequency of carrier sine wave (Hz)
#define f2 800                            // FSK f2 frequency of carrier sine wave (Hz)
#define f3 1100                           // FSK f3 frequency of carrier sine wave (Hz)

int delay0, delay1, delay2, delay3;

const int zetaLength = 4;
float zeta[zetaLength];
float s[zetaLength];
uint16_t s_dac[zetaLength];

char inData[20];                         // Allocate some space for the string

void setup( ) {
  dac.begin(0x64);
  Serial.begin(115200);

  /*calculate sampling period (time) of sine[4] for each FSK Frequency*/
  delay0 = (1000000 / f0 - 1000000 / defaultFreq) / zetaLength; //sampling period for FSK 500 Hz [(TF0 - Tdac) / zetaLength]
  delay1 = (1000000 / f1 - 1000000 / defaultFreq) / zetaLength; //sampling period for FSK 700 Hz [(TF1 - Tdac) / zetaLength]
  delay2 = (1000000 / f2 - 1000000 / defaultFreq) / zetaLength; //sampling period for FSK 900 Hz [(TF2 - Tdac) / zetaLength]
  delay3 = (1000000 / f3 - 1000000 / defaultFreq) / zetaLength; //sampling period for FSK 1000 Hz [(TF3 - Tdac) / zetaLength]

  Serial.print("delay0 is ");
  Serial.println(delay0);
  Serial.print("delay1 is ");
  Serial.println(delay1);
  Serial.print("delay2 is ");
  Serial.println(delay2);
  Serial.print("delay3 is ");
  Serial.println(delay3);

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
        if (tmp == 0) {               // for input 00 -> 500 Hz
          Serial.print("00 ");              //display bit value of input [k] (out ‘00’)
          waveIn1Baud(f0, delay0, zetaLength);
        }
        else if (tmp == 1) {          // for input 01 -> 700 Hz
          Serial.print("01 ");              //display bit value of input [k] (out ‘01’)
          waveIn1Baud(f1, delay1, zetaLength);
        }
        else if (tmp == 2) {          // for input 10 -> 900 Hz
          Serial.print("10 ");              //display bit value of input [k] (out ‘10’)
          waveIn1Baud(f2, delay2, zetaLength);
        }
        else if (tmp == 3) {          // for input 11 -> 1100 Hz
          Serial.print("11 ");              //display bit value of input [k] (out ‘11’)
          waveIn1Baud(f3, delay3, zetaLength);
        }
        inData[i] >>= 2;
      }
      Serial.println();
    }
    dac.setVoltage(0, false);             // for don't send
  }
}

void waveIn1Baud(int freq, int delayPerZeta, int zetaLength) {
  for (int sl = 0; sl < freq; sl++ ) {    //send S_DAC[4] [freq] cycles

    /*use a cycle loop s to send [zetaLength] sample/cycle*/
    for (int sl = 0; sl < zetaLength; sl++ ) {
      dac.setVoltage(s_dac[sl], false);
      delayMicroseconds(delayPerZeta);    // sampling delay
    }
  }
}
