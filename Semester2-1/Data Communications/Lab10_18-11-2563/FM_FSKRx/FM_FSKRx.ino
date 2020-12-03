#include <Wire.h>
#include <TEA5767.h>
#include <Adafruit_MCP4725.h>

TEA5767 radio = TEA5767();

/* cbi this for increase analogRead Speed */
#ifndef cbi
#define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

/* amin/amax : Amplitude in digital 10bit */
#define f0min   50                            // f0min <= f0 <= f0max
#define f0max   350
#define f1min   350                           // f1min <= f1 <= f1max
#define f1max   650
#define f2min   650                           // f2min <= f2 <= f2max
#define f2max   950
#define f3min   950                           // f3min <= f3 <= f3max
#define f3max   1250

#define microsPerBaud 1000000
const int baudPer1char = 4;                   // Number of baud/char(8bits)

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
  Wire.begin();
  radio.set_frequency(107.0);                    // pick your own frequency
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
      
      if (prevTime == 0 or micros() - prevTime >= microsPerBaud) {
        prevTime = micros();
      }
      else {
        /* check period of input analog signal */
        float freq = microsPerBaud / (micros() - prevTime);

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

        if (micros() - timer >= microsPerBaud) {
          Serial.print("->");
          Serial.print(recieveByte);
          Serial.print(" ");
          timer = micros();
          recieveByte <<= 2*countBaud;
          recieveData = recieveData | recieveByte;
          countBaud += 1;
             
          if (countBaud == baudPer1char) {
            Serial.println((char)recieveData);
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
