#define ENA 10
#define IN1 6
#define IN2 7

#define ENB 11
#define IN3 8
#define IN4 9

#define LEFT 0
#define RIGHT 1
#define STRAIGHT 0
#define BACK 1
#define NORMAL 0
#define REVERSE 1

void setup(){
  pinMode(ENA,OUTPUT);
  analogWrite(ENA,150);
  pinMode(IN1,OUTPUT);
  pinMode(IN2,OUTPUT);

  pinMode(ENB,OUTPUT);
  analogWrite(ENB,160);
  pinMode(IN3,OUTPUT);
  pinMode(IN4,OUTPUT);
}

void loop(){
  fn_stop(500);
  fn_go(STRAIGHT,1000);
  
  fn_stop(500);
  fn_spin(RIGHT,192);
  
}
//--------------------- User define function --------------------
//------------- Car function ------------------------
void fn_go(int mode ,int delayTime){
  if(mode == STRAIGHT){
    ctrl_Lmotor_on(NORMAL);
    ctrl_Rmotor_on(NORMAL);
  }
  else if(mode == BACK){
    ctrl_Lmotor_on(REVERSE);
    ctrl_Rmotor_on(REVERSE);
  }
  
  delay(delayTime);
}
void fn_turn(int mode ,int delayTime){
  if(mode == LEFT){
    ctrl_Lmotor_off();
    ctrl_Rmotor_on(NORMAL);
  }
  else if(mode == RIGHT){
    ctrl_Lmotor_on(NORMAL);
    ctrl_Rmotor_off();
  }
  
  delay(delayTime);
}
void fn_spin(int mode ,int delayTime){
  if(mode == LEFT){
    ctrl_Lmotor_on(REVERSE);
    ctrl_Rmotor_on(NORMAL);
  }
  else if(mode == RIGHT){
    ctrl_Lmotor_on(NORMAL);
    ctrl_Rmotor_on(REVERSE);
  }

  delay(delayTime);
}
void fn_stop(int delayTime){
  ctrl_Lmotor_off();
  ctrl_Rmotor_off();
  
  delay(delayTime);
}
//---------------------------------------------------
//-------------- Control moter ----------------------
void ctrl_Lmotor_on(int mode){
  if(mode == NORMAL){
    digitalWrite(IN1,HIGH);
    digitalWrite(IN2,LOW);
  }
  else if(mode == REVERSE){
    digitalWrite(IN1,LOW);
    digitalWrite(IN2,HIGH);
  }
}
void ctrl_Lmotor_off(){
  digitalWrite(IN1,LOW);
  digitalWrite(IN2,LOW);
}

void ctrl_Rmotor_on(int mode){
  if(mode == NORMAL){
    digitalWrite(IN3,LOW);
    digitalWrite(IN4,HIGH);
  }
  else if(mode == REVERSE){
    digitalWrite(IN3,HIGH);
    digitalWrite(IN4,LOW);
  }
}
void ctrl_Rmotor_off(){
  digitalWrite(IN3,LOW);
  digitalWrite(IN4,LOW);
}
//---------------------------------------------------
