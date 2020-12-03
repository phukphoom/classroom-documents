#include <Wire.h>
#include <Adafruit_MCP4725.h>

/* cbi this for increase analogRead Speed */
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

const int baudPer1uint8_t = 4;                 // Number of baud/uint8_t(8bits)

/* amin/amax : Amplitude in digital 10bit */
#define f0min   400                            // f0min <= f0 <= f0max
#define f0max   600
#define f1min   600                            // f1min <= f1 <= f1max
#define f1max   800
#define f2min   800                            // f2min <= f2 <= f2max
#define f2max   1000
#define f3min   1000                           // f3min <= f3 <= f3max
#define f3max   1200

/* amplitude difference for detecting rising or falling signal */
#define r_slope 10
int max = 0;
int prev = 0;
long prevTime = 0;
int check = false;

long timer = 0;

int countBaud = 0;
uint8_t recieveByte = 0x00;
uint8_t recieveData = 0x00;

void setup() {
  Serial.begin(115200);
  sbi(ADCSRA, ADPS2) ;                          // this for increase analogRead Speed
  cbi(ADCSRA, ADPS1) ;
  cbi(ADCSRA, ADPS0) ;
}

void loop() {
  int tmp = analogRead(A0);                     // read signal from analog pin

  if (tmp - prev > r_slope && check == false) {
    max = 0;
    check = true;                               // change check status is true
  }

  /*update max value*/
  if (tmp > max) {
    max = tmp;
  }

  /*check for falling signal*/
  if (max - tmp > r_slope) {
    if (check == true) {
      
      if (prevTime == 0 or micros() - prevTime >= 900000) {
        prevTime = micros();
      }
      else {
        /* check period of input analog signal */
        float freq = 1000000 / (micros() - prevTime);
        
        if (f0min <= freq && freq < f0max) {
          recieveByte = 0x00;
        }
        else if (f1min <= freq && freq < f1max) {
          recieveByte = 0x01;
        }
        else if (f2min <= freq && freq < f2max) {
          recieveByte = 0x02;
        }
        else if (f3min <= freq && freq < f3max) {
          recieveByte = 0x03;
        }
        
        if (micros() - timer >= 1000000) {
          timer = micros();
          recieveByte <<= 2*countBaud;
          recieveData = recieveData | recieveByte;
          countBaud += 1;
          
          if (countBaud == baudPer1uint8_t) {
            Serial.println((int)recieveData);
            countBaud = 0;
            recieveData = 0x00;
          }
        }
      }
      
      prevTime = micros();
      
    }
    check = false;                               // change check status is false
  }
  prev = tmp;                                    // assign temp value to previous
}
