#define defaultFreq 1700                    // DAC speed (Hz)
#define freqSine 1000                        // freqSine : frequency of carrier sine wave (Hz)

int delay0;

const float A[4] = {1, 2, 3, 4};            // A[00]-A[11] : ASK Amplitude (0,5] (V)
const int cyclePerBaud = 5;                 // Number of cycle/baud
const int baudPer1Char = 4;                 // Number of baud/char(8bits)

/* amin/amax : Amplitude in digital 10bit */
#define a0min   0                           // a0min <= a0 <= a0max
#define a0max   1023*((A[0]+A[1])/2)/5
#define a1min   1023*((A[0]+A[1])/2)/5      // a1min <= a1 <= a1max
#define a1max   1023*((A[1]+A[2])/2)/5
#define a2min   1023*((A[1]+A[2])/2)/5      // a2min <= a2 <= a2max
#define a2max   1023*((A[2]+A[3])/2)/5
#define a3min   1023*((A[2]+A[3])/2)/5      // a3min <= a3 <= a3max
#define a3max   1023

/* amplitude difference for detecting rising or falling signal */
#define r_slope 10
int max = 0;
int prev = 0;
int check = false;

int countCycle = 0;
int countBaud = 0;
uint8_t recieveByte = 0x00;
uint8_t recieveData = 0x00;

void setup() {
  Serial.begin(115200);
}

void loop() {
  int tmp = analogRead(A0);                 // read signal from analog pin
  
  if (tmp - prev > r_slope && check == false) {
    max = 0;
    check = true;                           // change check status is true
  }
  
  /*update max value*/
  if (tmp > max) {                          
    max = tmp;
  }
  
  /*check for falling signal*/
  if (max - tmp > r_slope) { 
    if (check == true) {
      if (a0min <= max && max < a0max) {
        recieveByte = 0x00;
        countCycle++;
      }
      else if (a1min <= max && max < a1max) {
        recieveByte = 0x01;
        countCycle++;
      }
      else if (a2min <= max && max < a2max) {
        recieveByte = 0x02;
        countCycle++;
      }
      else if (a3min <= max && max < a3max) {
        recieveByte = 0x03;
        countCycle++;
      }
      
      if (countCycle == cyclePerBaud) {
        recieveByte <<= 2*countBaud;
        recieveData = recieveData | recieveByte;
        countBaud++;
        countCycle = 0;
      }

      if (countBaud == baudPer1Char){
        Serial.print((char)recieveData);
        recieveData = 0x00;
        countBaud = 0;
      }
    }
    check = false;                            // change check status is false
  }
  prev = tmp;                                 // assign temp value to previous
}
