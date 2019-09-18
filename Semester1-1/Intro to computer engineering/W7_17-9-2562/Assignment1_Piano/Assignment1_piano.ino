#include"pitches.h"
#define PIN_C   7
#define PIN_D   6
#define PIN_E   5
#define PIN_F   4
#define PIN_G   3
#define PIN_MODE  10
#define SPEAKER 8
//------------------------------
typedef struct Piano_record{
  int note;
  int timer;
}varpiano;
//------------------------------
void setup() {
  pinMode(PIN_C,INPUT_PULLUP);
  pinMode(PIN_D,INPUT_PULLUP);
  pinMode(PIN_E,INPUT_PULLUP);
  pinMode(PIN_F,INPUT_PULLUP);
  pinMode(PIN_G,INPUT_PULLUP);
  pinMode(PIN_MODE,INPUT_PULLUP);
   
  pinMode(SPEAKER,OUTPUT);

  Serial.begin(9600);
}
//------------------------------
bool Mode_Replay = false;
varpiano piano[300];
int numnote = 0;

int memnote = 10000;
//------------------------------
void loop() {
  if(!Mode_Replay){
    digitalWrite(LED_BUILTIN,HIGH);
    int Push_Note;
    int starttime = millis();
    if(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH){
      while(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH && digitalRead(PIN_MODE)==HIGH){
        Push_Note = 0;
        noTone(SPEAKER);
      }
      if(digitalRead(PIN_MODE)==LOW){
        Mode_Replay = true;
        Serial.println("-------------------------------->GO TO REPLAY");
        delay(100);
      }
      piano[numnote].note = Push_Note;
      piano[numnote].timer = millis()-starttime;
      numnote++;
      Serial.print(piano[numnote-1].note);
      Serial.print("\t< note -- time >\t");
      Serial.println(piano[numnote-1].timer);
      memnote = Push_Note;
    }
    else if(!(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH)){
      Push_Note = 0;
      int count;
      count = !digitalRead(PIN_C)+!digitalRead(PIN_D)+!digitalRead(PIN_E)+!digitalRead(PIN_F)+!digitalRead(PIN_G);
      if(digitalRead(PIN_C)==LOW){
        Push_Note = Push_Note + NOTE_C4;
      }
      if(digitalRead(PIN_D)==LOW){
        Push_Note = Push_Note + NOTE_D4;
      }
      if(digitalRead(PIN_E)==LOW){
        Push_Note = Push_Note + NOTE_E4;
      }
      if(digitalRead(PIN_F)==LOW){
        Push_Note = Push_Note + NOTE_F4;
      }
      if(digitalRead(PIN_G)==LOW){
        Push_Note = Push_Note + NOTE_G4;
      }
      Push_Note = Push_Note/count;
        
      tone(SPEAKER,Push_Note);
      
      int memcount = count;
      int checkcount = count;
      while(checkcount==memcount){
        checkcount = !digitalRead(PIN_C)+!digitalRead(PIN_D)+!digitalRead(PIN_E)+!digitalRead(PIN_F)+!digitalRead(PIN_G);
      }
      
      if(memnote!=Push_Note){
        piano[numnote].note = Push_Note/count;
        piano[numnote].timer = millis()-starttime;
        numnote++;
        
        Serial.print(piano[numnote-1].note);
        Serial.print("\t< note -- time >\t");
        Serial.println(piano[numnote-1].timer);
      }
      memnote = Push_Note;  
    }
  }

  else{
    digitalWrite(LED_BUILTIN,LOW);
    for(int i=1;i<numnote;i++){
      if(piano[i].note!=0){
        tone(SPEAKER,piano[i].note);
        delay(piano[i].timer);
      }
      else{
        noTone(SPEAKER);
        delay(piano[i].timer);
      }
      noTone(SPEAKER);
      Serial.print(piano[i].note);
      Serial.print("\t< note -- time >\t");
      Serial.println(piano[i].timer);
    }
    Serial.println("----------------------------------------->END REPLAY");
    while(digitalRead(PIN_MODE)==HIGH){
      // waiting Mode Push
    }
    if(digitalRead(PIN_MODE)==LOW){
      int starttime = millis();
      while(digitalRead(PIN_MODE)==LOW){
        //timer push mode button
      }
      if(millis()-starttime>=3000){
        Mode_Replay = false;
        clear_record();
        Serial.println("-------------------------------->GO TO PLAY");
      }
      else{
        Serial.println("-------------------------------->GO TO REPLAY");
      }
      delay(100);
    }
  }
}

void clear_record(){
  for(int i=0;i<numnote;i++){
    piano[i].note = 0;
    piano[i].timer = 0;
  }
  numnote = 0;
}
