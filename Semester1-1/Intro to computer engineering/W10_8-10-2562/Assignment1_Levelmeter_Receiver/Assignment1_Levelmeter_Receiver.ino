#include <SoftwareSerial.h>
#define Rx_PIN 7
#define Tx_PIN 8

SoftwareSerial mySerial(Rx_PIN,Tx_PIN);          

void setup(){
  Serial.begin(9600);
  mySerial.begin(9600);
}

int realdegree;
void loop(){
  //--------------------------------------------------------- Get data
  int getdegree = 0;
  int multiply = 1;
  while(mySerial.available()) {
    int input = mySerial.read();
    if(input!='\n'){                                       //reverse data from nano board
      getdegree = getdegree + (input - '0') * multiply;    
      multiply = multiply * 10;
    }
    else{
      realdegree = getdegree;
      getdegree = 0;
      multiply = 1;
    }
  }

  //--------------------------------------------------------- Show data
  Serial.print(realdegree);
  Serial.println(" deg");
  
  delay(1);
}
