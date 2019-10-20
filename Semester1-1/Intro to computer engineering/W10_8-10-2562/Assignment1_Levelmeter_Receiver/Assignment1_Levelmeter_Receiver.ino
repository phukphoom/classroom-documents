#include <SoftwareSerial.h>
#include "FontLEDClock.h"
#include"LedControl.h"

#define Rx_PIN 7
#define Tx_PIN 8
#define CS_PIN     10
#define CLK_PIN    13
#define DIN_PIN    11
#define LED_MODULE 4

SoftwareSerial mySerial(Rx_PIN,Tx_PIN);          
LedControl lc = LedControl(DIN_PIN ,CLK_PIN ,CS_PIN ,LED_MODULE);

void setup(){
  Serial.begin(9600);
  mySerial.begin(9600);

  led_init();
}

int realdegree;

void loop(){
  //--------------------------------------------------------- Get data
  int getdegree = 0;
  int multiply = 1;
  while(mySerial.available()) {
    int input = mySerial.read();
    if(input!='\n'){                                          //reverse data from nano board
      getdegree = getdegree + (input - '0') * multiply;    
      multiply = multiply * 10;
    }
    else{
      realdegree = getdegree;
      getdegree = 0;
      multiply = 1;
    }
  }
  
  //--------------------------------------------------------- Show data in Led dot matrix 
  if(realdegree/100!=0){
    led_print(3,realdegree/100%10);       //Print หลักร้อย on LED_dotmatrix on address 3
  }
  else{
    lc.clearDisplay(3);
  }
  if(realdegree/10!=0){
    led_print(2,(realdegree/10)%10);      //Print หลักสิบ on LED_dotmatrix on address 2
  }
  else{
    lc.clearDisplay(2);
  }
  led_print(1,realdegree%10);             //Print หลักหน่วย on LED_dotmatrix on address 1

  led_printunit(0);                       //Print unit Deg
  
  //--------------------------------------------------------- Show data in Serial monitor
  Serial.print(realdegree);
  Serial.println(" deg");
  
  delay(1);
}

//------------------------------------------------------------------------------------------------- function
void led_init(){                     
  int devices = lc.getDeviceCount();
  for(int address=0;address<devices;address++){
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}

void led_print(int address,int num){
  for(int i=0;i<5;i++){
    lc.setColumn(address,i+2,myfont[31+num][i]);
  }
}

void led_printunit(int address){
  lc.setColumn(address,1,byte(0xE0));
  lc.setColumn(address,2,byte(0xA0));
  lc.setColumn(address,3,byte(0xE0));
}
