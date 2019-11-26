#define SENSOR_1 A2
#define SENSOR_2 A3
#define SENSOR_3 A4
#define SENSOR_4 A5
#define SENSOR_5 A6

#define ENA 10
#define IN1 6
#define IN2 7
#define ENB 11
#define IN3 8
#define IN4 9
//-------------------------------------------------------------------- SETUP -------------------------------------------------------------------------------------------
void setup(){
  pinMode(ENA,OUTPUT);
  pinMode(IN1,OUTPUT);
  pinMode(IN2,OUTPUT);

  pinMode(ENB,OUTPUT);
  pinMode(IN3,OUTPUT);
  pinMode(IN4,OUTPUT);

  Serial.begin(9600);
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//--------------------------------------------------------------------- Main -------------------------------------------------------------------------------------------
//------------------------- PID Control variable ----------------------
int baseSpeed = 60;
int maxSpeed = 200;

int Kp = 20;
int Kd = 15;
int Ki = 0;

int error = 0;
int preError = 0;
int sumError = 0;
//---------------------------------------------------------------------
//------------------------- Sensor variable ---------------------------
int sensorAnalogValue[5];
int sensorDigitalValue[5];
//---------------------------------------------------------------------
//------------------------- Normal variable ---------------------------

//---------------------------------------------------------------------
//------------------------- Main Loop ---------------------------------
void loop(){
  //----- get sensor value -----------
  readSensorValue();

  //----- Show Led Detect ------------
  ledDebug(sensorDigitalValue[0],sensorDigitalValue[1],sensorDigitalValue[2],sensorDigitalValue[3],sensorDigitalValue[4]);
  
  //----- Get error ------------------
  error = getError(sensorDigitalValue[0],sensorDigitalValue[1],sensorDigitalValue[2],sensorDigitalValue[3],sensorDigitalValue[4]); 

  //-----  Action --------------------
  if(error == 100){
    motorControlLeft(0);
    motorControlRight(70);
  }
  else if(error == -10){
    motorControlLeft(-70);
    motorControlRight(120);
  }
  else if(error == 10){
    motorControlLeft(120);
    motorControlRight(-70);
  }
  else{
    //adjust motor speed
    int adjustSpeed;
    if(preError != 100 && preError != 10 && preError !=-10){
       adjustSpeed = Kp*error + Kd*(error - preError);
    }
    else{
      adjustSpeed = Kp*error;
    }
    int leftMotorSpeed = baseSpeed + adjustSpeed;
    int rightMotorSpeed = baseSpeed - adjustSpeed;

    //limit motor speed
    if(leftMotorSpeed > maxSpeed){
      leftMotorSpeed = maxSpeed;
    }
    if(leftMotorSpeed < -maxSpeed){
      leftMotorSpeed = -maxSpeed;
    }
    if(rightMotorSpeed > maxSpeed){
      rightMotorSpeed = maxSpeed;
    }
    if(rightMotorSpeed < -maxSpeed){
      rightMotorSpeed = -maxSpeed;
    }

    //Control motor
    motorControlLeft(leftMotorSpeed);
    motorControlRight(rightMotorSpeed);
  }

  //----- remember previous error -----
  preError = error;
  if(error!=10 || error!=-10 ||error!=100){
    //sumation error
    sumError += error;
  }
}
//------------------------- Main Loop ---------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------- USER DEFINE -------------------------------------------------------------------------------------
//------------------------- Sensor get value --------------------------
void readSensorValue(){
  for(int i=0;i<5;i++){
    sensorAnalogValue[i] = getAnalogValue(SENSOR_1+i);
    sensorDigitalValue[i] = getDigitalValue(sensorAnalogValue[i]);
    Serial.print(sensorAnalogValue[i]);
    Serial.print(" ");
  }
  Serial.println();
}

int getAnalogValue(int pin){
  int sensor_analog_value = 0;
  int buff_size = 40 ;
  for(int i=0;i<buff_size;i++){
    sensor_analog_value += analogRead(pin);
  }
  
  return sensor_analog_value/buff_size; 
}
int getDigitalValue(int sensor_analog_value){
  int indicator = 295;
  if(sensor_analog_value >= indicator){
    return 1;  //white
  }
  else{
    return 0;  //black
  }
}
//---------------------------------------------------------------------
//------------------------- Error get value ---------------------------
int getError(int value_1, int value_2, int value_3, int value_4, int value_5){
    //detect 5 sensors
    if(value_1 == 1 && value_2 == 1 && value_3 == 1 && value_4 == 1 && value_5 == 1){
      return preError;
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 0 && value_4 == 0 && value_5 == 0){ 
      return preError;
    }

    //detect 4 sensors
    else if(value_1 == 1 && value_2 == 1 && value_3 == 1 && value_4 == 1 && value_5 == 0){
      if(preError == 10){
        return preError;
      }
      return -10; 
    }
    if(value_1 == 0 && value_2 == 1 && value_3 == 1 && value_4 == 1 && value_5 == 1){
      if(preError == -10){
        return preError;
      }
      return 10; 
    }

    //detect 3 sensors
    else if(value_1 == 1 && value_2 == 1 && value_3 == 1 && value_4 == 0 && value_5 == 0){
      if(preError == -10 || preError == 10){
        return preError;
      }
      return -1; 
    }
    else if(value_1 == 0 && value_2 == 1 && value_3 == 1 && value_4 == 1 && value_5 == 0){
      return 0; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 1 && value_4 == 1 && value_5 == 1){
      if(preError == -10 || preError == 10){
        return preError;
      }
      return 1; 
    }
    
    //detect 2 sensors
    else if(value_1 == 1 && value_2 == 1 && value_3 == 0 && value_4 == 0 && value_5 == 0){
      if(preError == -10 || preError == 10){
        return preError;
      }
      return -3; 
    }
    else if(value_1 == 0 && value_2 == 1 && value_3 == 1 && value_4 == 0 && value_5 == 0){
      return -1; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 1 && value_4 == 1 && value_5 == 0){
      return 1; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 0 && value_4 == 1 && value_5 == 1){
      if(preError == -10 || preError == 10){
        return preError;
      }
      return 3; 
    }
  
    //detect 1 sensor
    else if(value_1 == 1 && value_2 == 0 && value_3 == 0 && value_4 == 0 && value_5 == 0){
      return -4; 
    }
    else if(value_1 == 0 && value_2 == 1 && value_3 == 0 && value_4 == 0 && value_5 == 0){
      return -1; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 1 && value_4 == 0 && value_5 == 0){
      return 0; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 0 && value_4 == 1 && value_5 == 0){
      return 1; 
    }
    else if(value_1 == 0 && value_2 == 0 && value_3 == 0 && value_4 == 0 && value_5 == 1){
      return 4; 
    }

    //default case
    else {
      return preError;
    }
}
//---------------------------------------------------------------------
//------------------------- Motor Control -----------------------------
void motorControlLeft(int left_motor_speed){
  //forward
  if(left_motor_speed >= 0){
    analogWrite(ENA, left_motor_speed);
    digitalWrite(IN1,HIGH);
    digitalWrite(IN2,LOW);
  }
  //reverse
  else{
    analogWrite(ENA, -(left_motor_speed));
    digitalWrite(IN1,LOW);
    digitalWrite(IN2,HIGH);
  }
}
void motorControlRight(int right_motor_speed){
  //forward
  if(right_motor_speed >= 0){
    analogWrite(ENB, right_motor_speed);
    digitalWrite(IN3,LOW);
    digitalWrite(IN4,HIGH);
  }
  //reverse
  else{
    analogWrite(ENB, -(right_motor_speed));
    digitalWrite(IN3,HIGH);
    digitalWrite(IN4,LOW);
  }
}
//---------------------------------------------------------------------
//------------------------- Led Debug Show  ---------------------------
void ledDebug(int value_1, int value_2, int value_3, int value_4, int value_5){
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  
  digitalWrite(3,value_1);
  digitalWrite(4,value_2);
  digitalWrite(5,value_3);
  digitalWrite(12,value_4);
  digitalWrite(13,value_5);
}
//---------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
