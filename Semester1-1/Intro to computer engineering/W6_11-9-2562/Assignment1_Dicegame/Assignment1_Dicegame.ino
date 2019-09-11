#define PIN_DP 2
#define PIN_A  3
#define PIN_B  4
#define PIN_C  5
#define PIN_D  6
#define PIN_E  7
#define PIN_F  8
#define PIN_G  9
#define ButtonA 10
#define ButtonB 11
#define LEDgreen 12
#define LEDred 13

int code_seven_segment[6]={207,146,134,204,164,160};                      // code for print : '1','2','3','4','5','6'
int code_print_minus = 254;                                               // code for print : '-'
int code_print_nothing = 255;
int segment_index = 0;

int setup_num = 0;
int random_num = 999999;
bool endgame_status = false;

//------------------------------------------------------------------------------------------
void setup() {
  pinMode(PIN_DP,OUTPUT);  
  pinMode(PIN_A,OUTPUT); 
  pinMode(PIN_B,OUTPUT); 
  pinMode(PIN_C,OUTPUT);  
  pinMode(PIN_D,OUTPUT);  
  pinMode(PIN_E,OUTPUT);  
  pinMode(PIN_F,OUTPUT);  
  pinMode(PIN_G,OUTPUT);  

  pinMode(ButtonA,INPUT_PULLUP);
  pinMode(ButtonB,INPUT_PULLUP);

  pinMode(LEDgreen,OUTPUT);
  pinMode(LEDred,OUTPUT);
  
  Serial.begin(9600);
 
  randomSeed(analogRead(A0));
  gamestart_setting();
}

void loop() { 
  
  debugging();
  
  if(digitalRead(ButtonA)==LOW){                                               //internal Pullup
    Ctrl_ButtonA();
    endgame_status=true;
  }

  if(digitalRead(ButtonB)==LOW){                                               //internal Pullup
    if(endgame_status==true){
      Ctrl_ButtonB();
    }
    gamestart_setting();
    endgame_status=false;
  }
  delay(100);
}

//---------------------------- common function --------------------------------------------
void gamestart_setting(){
  print_num(code_print_minus);
  digitalWrite(LEDgreen,LOW);
  digitalWrite(LEDred,LOW);
}
void debugging(){
  Serial.print("player_num = ");
  Serial.print(setup_num);
  Serial.print("| com_num = ");
  Serial.println(random_num);
}
void print_num(int num){
  int i,j=7;
  for(i=PIN_DP;i<=PIN_G;i++){
    digitalWrite(i,bitRead(num,9-i));
  }
}
//----------------------------- control function--------------------------------------------
void Ctrl_ButtonA(){
  setup_num = segment_index+1;
  
  print_num(code_seven_segment[segment_index]);                                 //print set up number
    
  segment_index++;
  if(segment_index==6){
    segment_index = 0;
  }
}
void Ctrl_ButtonB(){
  random_num = random(1,7);
  print_num(code_print_nothing);                                                 //light off 7-Segment
  for(int i=0;i<3;i++){                                                          //loading effect
    for(int j=0;j<6;j++){
      digitalWrite(PIN_A+j,HIGH);
      delay(100);
      digitalWrite(PIN_A+j,LOW);
    }
  }
  for(int i=0;i<3;i++){                                                           //print random number
    print_num(code_seven_segment[random_num-1]);
    delay(100);
    print_num(code_print_nothing);
    delay(100);
  }
  print_num(code_seven_segment[random_num-1]);

  if(random_num==setup_num){                                                      //display win signal
    ledwin();
  }
  else{                                                                           //display lose signal
    ledlose();
  }
  endgame_status = true;
}
//----------------------------- win/lose function LEDlight ----------------------------------
void ledwin(){
  for(int i=0;i<6;i++){
    digitalWrite(LEDgreen,i%2);
    delay(200);
  }
}
void ledlose(){
  for(int i=0;i<6;i++){
    digitalWrite(LEDred,i%2);
    delay(200);
  }
}
