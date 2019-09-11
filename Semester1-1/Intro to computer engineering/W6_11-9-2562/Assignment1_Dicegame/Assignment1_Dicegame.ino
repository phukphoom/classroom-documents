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

int code_seven_segment[6]={207,146,134,204,164,160}; //1,2,3,4,5,6
int codeminus = 254;

int setting_num = 0;
int random_num = 999999;
int segment_index = 0;
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
  print_num(codeminus); //print segment '-'
}

void loop() { 
   
  debugging();
  
  /*if(endgame_status!=true){
    
  }*/
  if(digitalRead(ButtonA)==LOW){  //Internal Pullup
      endgame_status=true;
      Ctrl_A();
    }

    if(digitalRead(ButtonB)==LOW){  //Internal Pullup
      if(endgame_status==true){
        Ctrl_B();
      }
      endgame_status=false;
    }

    delay(100);
  
}

//------------------------------------------------------------------------------------------
void print_num(int num){
  int i,j=7;
  for(i=PIN_DP;i<=PIN_G;i++){
    digitalWrite(i,bitRead(num,9-i));
  }
}

void Ctrl_A(){
  setting_num = segment_index+1;
  print_num(code_seven_segment[segment_index]);
    
  segment_index++;
  if(segment_index==6){
    segment_index = 0;
  }
}
void Ctrl_B(){
  random_num = random(1,7);
  print_num(255);
  for(int i=0;i<3;i++){                                                          //loading
    for(int j=0;j<6;j++){
      digitalWrite(3+j,HIGH);
      delay(100);
      digitalWrite(3+j,LOW);
    }
  }
  for(int i=0;i<3;i++){ 
    print_num(code_seven_segment[random_num-1]);
    delay(100);
    print_num(255);
    delay(100);
  }
  print_num(code_seven_segment[random_num-1]);

  if(random_num==setting_num){
    ledwin();
  }
  else{
    ledlose();
  }
  endgame_status = true;
}

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

void debugging(){
  Serial.print("player_num = ");
  Serial.print(setting_num);
  Serial.print("| com_num = ");
  Serial.println(random_num);
}
