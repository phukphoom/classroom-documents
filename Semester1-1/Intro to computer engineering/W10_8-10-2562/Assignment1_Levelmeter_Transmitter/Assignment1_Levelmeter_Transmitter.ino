#include<SoftwareSerial.h>
#define VCC   A0
#define GND   A4
#define Z     A3
#define CALIBRATE_PIN 4
#define BUZZER_PIN    12
#define Rx_PIN 7
#define Tx_PIN 8

SoftwareSerial mySerial(Rx_PIN,Tx_PIN);
int z_max = -999;
int z_min = 999;
int z_avg;
int z_g;

void setup(){
  mySerial.begin(9600);
  Serial.begin(9600);
  
  pinMode(CALIBRATE_PIN,INPUT_PULLUP);
  pinMode(BUZZER_PIN,OUTPUT);
  
  analogWrite(GND,0);
  analogWrite(VCC,1024);
}

void loop(){
  //--------------------------------------------------------- Reading value z_axis
  int z_value = read_axis(Z);
  
  //--------------------------------------------------------- Caribration
  if(digitalRead(CALIBRATE_PIN)==LOW){
    tone(BUZZER_PIN,500,50);
    calibrate_zaxis(z_value);
    delay(10);
  }
  noTone(BUZZER_PIN);
 
  //--------------------------------------------------------- Calculating degree
  double radius;
  double degree;
  if(z_value>=z_min && z_value<=z_max){
    if(z_value>=z_avg){            //theta is on costant 1
      radius = acos((double)(z_value-z_avg)/(double)z_g);
    }
    else{                          // theta is on costant 2
      radius = PI - acos((double)(z_value-z_avg)/(double)z_g);
    }
    degree = radius*180/PI;
  }
  
  //--------------------------------------------------------- Sending data
  if(degree<=90 && degree>=0){
    int msg = (int)degree;
    while(msg>0){
      char senddata = msg%10 + '0';
      mySerial.write(senddata);
      msg = msg/10;
    }
    mySerial.print('\n');
  }
  
  //--------------------------------------------------------- Show log
  Serial.print(degree);
  Serial.print(" deg");
 
  Serial.print("\tz -> ");
  Serial.print(z_min);
  Serial.print(" : ");
  Serial.print(z_avg);
  Serial.print(" : ");
  Serial.print(z_max);
  Serial.print("\tG# ");
  Serial.print(z_g);
  Serial.print("\tvalue# ");
  Serial.println(z_value);
}

//------------------------------------------------------------------------------ function accel
int read_axis(int axis){
  long value = 0;
  const int buffering = 500;
  for(int i=0;i<buffering;i++){
    value = value + analogRead(axis);
  }
  return value/buffering;
}

void calibrate_zaxis(int z_value){
  if(z_value>z_max){
    z_max = z_value;
  }
  if(z_value<z_min){
    z_min = z_value;
  }

  z_avg = (z_max + z_min)/2;
  z_g = z_max-z_avg;
}
