#include <Wire.h>
#include <Adafruit_MCP4725.h>

Adafruit_MCP4725 dac;

#define defaultFreq 1700                // DAC speed (Hz) for 1 cycle wave
#define f0 500                          // FSK f0 frequency of carrier sine wave (Hz)
#define f1 700                          // FSK f1 frequency of carrier sine wave (Hz)
#define f2 900                          // FSK f2 frequency of carrier sine wave (Hz)
#define f3 1100                         // FSK f3 frequency of carrier sine wave (Hz)
int delay0, delay1, delay2, delay3;

const int zetaLength = 4;
float zeta[zetaLength];
float s[zetaLength];
uint16_t s_dac[zetaLength];

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
  
  Serial.flush();                       // for clear buffer serial
}

void loop( ) {
  if (Serial.available() > 0) {
    int inDec = Serial.parseInt();      // get Dec from Serial

    /*create an array store every set of 2 bits from each input byte*/
    int inData[4];
    for (int i=3;i>=0;i--){
      inData[i] = inDec & 3;
      inDec >>= 2;
    }

    /*for each set of 2 bits in a data byte*/
    for (int k = 3 ; k >= 0 ; k--) {
      if (inData[k] == 0) {               // for input 00 -> 500 Hz
        Serial.print("00 ");              //display bit value of input [k] (out ‘00’)
        waveIn1Baud(f0,delay0,zetaLength);
      }
      else if (inData[k] == 1) {          // for input 01 -> 700 Hz
        Serial.print("01 ");              //display bit value of input [k] (out ‘01’)
        waveIn1Baud(f1,delay1,zetaLength);
      }
      else if (inData[k] == 2) {          // for input 10 -> 900 Hz
        Serial.print("10 ");              //display bit value of input [k] (out ‘10’)
        waveIn1Baud(f2,delay2,zetaLength);
      }
      else if (inData[k] == 3) {          // for input 11 -> 1100 Hz
        Serial.print("11 ");              //display bit value of input [k] (out ‘11’)
        waveIn1Baud(f3,delay3,zetaLength);
      }  
    }
    Serial.println();
    dac.setVoltage(0, false);             // for don't send
  }
}

void waveIn1Baud(int freq,int delayPerZeta,int zetaLength){
  for (int sl = 0; sl < freq; sl++ ) {    //send S_DAC[4] [freq] cycles
    
    /*use a cycle loop s to send [zetaLength] sample/cycle*/
    for (int sl = 0; sl < zetaLength; sl++ ) {
      dac.setVoltage(s_dac[sl], false);
      delayMicroseconds(delayPerZeta);    // sampling delay
    }
  }
}
