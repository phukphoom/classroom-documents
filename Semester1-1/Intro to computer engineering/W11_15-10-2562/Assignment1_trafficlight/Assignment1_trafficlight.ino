/////////////////////////////////////////////////////////// Define ////////////////////////////////////////////////////////////////////////////
#define ROAD_S2N   2
#define ROAD_W2E   3
#define CROSSWALK  4

#define LED_S_RED     5
#define LED_S_YELLOW  6 
#define LED_S_GREEN   7 

#define LED_W_RED     8 
#define LED_W_YELLOW  9 
#define LED_W_GREEN   10

#define LED_CROSSWALK_RED   11 
#define LED_CROSSWALK_GREEN 12

#define scango            0
#define swaitgreen        1
#define wcango            2
#define wwaitgreen        3
#define crossgo           4
#define crosswaitgreenS   5
#define crosswaitgreenW   6
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////// Variable ///////////////////////////////////////////////////////////////////////////
typedef struct State{
  unsigned long output;
  unsigned long wait;
  unsigned long nextState[8];
}state;

state traffic[7]={
  {B00110010  ,1000 ,{scango  ,crosswaitgreenS  ,wwaitgreen ,crosswaitgreenS  ,scango       ,crosswaitgreenS  ,wwaitgreen ,wwaitgreen}},
  {B10001010  ,500  ,{scango  ,scango           ,scango     ,scango           ,scango       ,scango           ,scango     ,scango}},
  {B10000110  ,1000 ,{wcango  ,crosswaitgreenW  ,wcango     ,crosswaitgreenW  ,swaitgreen   ,crosswaitgreenW  ,swaitgreen ,crosswaitgreenW}},
  {B01010010  ,500  ,{wcango  ,wcango           ,wcango     ,wcango           ,wcango       ,wcango           ,wcango     ,wcango}},
  {B10010001  ,1000 ,{crossgo ,crossgo          ,wcango     ,wcango           ,scango       ,scango           ,scango     ,scango}},
  {B01010010  ,500  ,{crossgo ,crossgo          ,crossgo    ,crossgo          ,crossgo      ,crossgo          ,crossgo    ,crossgo}},
  {B10001010  ,500  ,{crossgo ,crossgo          ,crossgo    ,crossgo          ,crossgo      ,crossgo          ,crossgo    ,crossgo}},
};

unsigned currentState = 0;
unsigned previousState;

unsigned input;                           // input to state
unsigned road_s2n ,road_w2e ,crosswalk;   // input from user       
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////// Main programe //////////////////////////////////////////////////////////////////////
void setup(){
  pinMode(ROAD_S2N,INPUT_PULLUP);
  pinMode(ROAD_W2E,INPUT_PULLUP);
  pinMode(CROSSWALK,INPUT_PULLUP);
  
  pinMode(LED_S_RED,OUTPUT);
  pinMode(LED_S_YELLOW,OUTPUT);
  pinMode(LED_S_GREEN,OUTPUT);

  pinMode(LED_W_RED,OUTPUT);
  pinMode(LED_W_YELLOW,OUTPUT);
  pinMode(LED_W_GREEN,OUTPUT);

  pinMode(LED_CROSSWALK_RED,OUTPUT);
  pinMode(LED_CROSSWALK_GREEN,OUTPUT);

  Serial.begin(9600);
}

void loop(){
  //------------- check for cosswalk light brink --------------
  if(previousState == crossgo && currentState != crossgo){
    long timer;
    for(int i=0;i<4;i++){
      timer = millis();
      digitalWrite(LED_CROSSWALK_GREEN,LOW);
      while(millis()-timer<=100);{
          // delay 100 ms 
      }
      timer = millis();
      digitalWrite(LED_CROSSWALK_GREEN,HIGH);
      while(millis()-timer<=100);{
          // delay 100 ms
      }
    }
  }
  //------------- ---------------------------------------------
  
  //-------------- output curr state --------------------------
  digitalWrite(LED_S_RED, !(traffic[currentState].output & B10000000));
  digitalWrite(LED_S_YELLOW, !(traffic[currentState].output & B01000000));
  digitalWrite(LED_S_GREEN, !(traffic[currentState].output & B00100000));
  
  digitalWrite(LED_W_RED, !(traffic[currentState].output & B00010000));
  digitalWrite(LED_W_YELLOW, !(traffic[currentState].output & B00001000));
  digitalWrite(LED_W_GREEN, !(traffic[currentState].output & B00000100));
  
  digitalWrite(LED_CROSSWALK_RED, !(traffic[currentState].output & B00000010));
  digitalWrite(LED_CROSSWALK_GREEN, !(traffic[currentState].output & B00000001));
    
  delay(traffic[currentState].wait);
  //-----------------------------------------------------------

  //-------------- input to go next state ---------------------
  road_s2n = digitalRead(ROAD_S2N);
  road_w2e = digitalRead(ROAD_W2E);
  crosswalk = digitalRead(CROSSWALK);

  input = 7-(road_s2n*4 + road_w2e*2 + crosswalk);
  //-----------------------------------------------------------

  //---- remember state curr state & go next state ------------
  previousState = currentState;
  currentState = traffic[currentState].nextState[input];
  //-----------------------------------------------------------
  
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
