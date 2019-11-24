//Define Sensor
#define SS1 A2
#define SS2 A3
#define SS3 A4
#define SS4 A5
#define SS5 A6

//Define Control Motor
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
//PID Control variable
int sumError = 0;
int preError = 0;
int error = 0;
int Kp = 25;
int Kd = 20;
int Ki = 0;

int baseSpeed = 60;
int maxSpeed = 150;

void loop(){
  //Sensor convert analog_value to digital_value
  int digitalSS1 = getDigitalValue(analogRead(SS1));
  int digitalSS2 = getDigitalValue(analogRead(SS2));
  int digitalSS3 = getDigitalValue(analogRead(SS3));
  int digitalSS4 = getDigitalValue(analogRead(SS4));
  int digitalSS5 = getDigitalValue(analogRead(SS5));

  //------ debug ------
  ledDebug(digitalSS1, digitalSS2, digitalSS3, digitalSS4, digitalSS5);
  //-------------------
  
  //Calculate motor speed
  error = getError(digitalSS1, digitalSS2, digitalSS3, digitalSS4, digitalSS5);
  sumError += error;
  
  int adjustSpeed = Kp*error + Kd*(error - preError);
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

  //------
  Serial.print(leftMotorSpeed);
  Serial.print("....");
  Serial.println(rightMotorSpeed);
  //------

  //Backup old error
  preError = error;
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------- USER DEFINE -------------------------------------------------------------------------------------
//------------------------------------------------ Calculation --------------------------------------------------------
int getDigitalValue(int analog_value){
  int indicator = 400;
  if(analog_value >= indicator){
      return 1; //white
  }
  else{
    return 0;   //black
  }
}

int getError(int value_1, int value_2, int value_3, int value_4, int value_5){
  if(value_1 + value_2 + value_3 + value_4 + value_5 == 0){
    return 0;
  }
  else if(value_1 + value_2 + value_3 + value_4 + value_5 == 1){
    return value_1*(-4) + value_2*(-2) + value_3*(0) + value_4*(2) + value_5*(4);
  }
  else if(value_1 + value_2 + value_3 + value_4 + value_5 == 2){
    return value_1*(-2) + value_2*(-1) + value_3*(0) + value_4*(1) + value_5*(2);
  }
  else if(value_1 + value_2 + value_3 + value_4 + value_5 == 3){
    return value_1*(-2) + value_2*(-1) + value_3*(0) + value_4*(1) + value_5*(2);
  }
  else if(value_1 + value_2 + value_3 + value_4 + value_5 == 4){
    return value_1*(-2) + value_2*(-1) + value_3*(0) + value_4*(1) + value_5*(2);
  }
  else if(value_1 + value_2 + value_3 + value_4 + value_5 == 5){
    return 0;
  }
}

//------------------------------------------------ Motor Control ------------------------------------------------------
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
//------------------------------------------------ Debug Show  --------------------------------------------------------
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

  Serial.print(value_1);
  Serial.print(" ");
  Serial.print(value_2);
  Serial.print(" ");
  Serial.print(value_3);
  Serial.print(" ");
  Serial.print(value_4);
  Serial.print(" ");
  Serial.print(value_5);
  Serial.print(" | ");
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
