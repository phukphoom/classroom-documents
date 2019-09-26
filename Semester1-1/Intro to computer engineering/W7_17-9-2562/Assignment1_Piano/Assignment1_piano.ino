#include"pitches.h"

#define PIN_C   7
#define PIN_D   6
#define PIN_E   5
#define PIN_F   4
#define PIN_G   3
#define PIN_MODE  10
#define SPEAKER 8

//------------------------------
typedef struct varpiano{
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
bool mode_replay = false;
varpiano piano[300];

int num_note = 0;
int mem_note = 10000;
//------------------------------

void loop() {
//-----------------------------------------------------------------------Play Mode------------------------------------------
  if(!mode_replay){
    digitalWrite(LED_BUILTIN,HIGH); // Show status play mode and recording
    int pushing_note;
    int starttime = millis();
    if(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH){
      while(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH && digitalRead(PIN_MODE)==HIGH){
        pushing_note = 0;
        noTone(SPEAKER);
      }
      if(digitalRead(PIN_MODE)==LOW){
        mode_replay = true;
        Serial.println("-------------------------------->GO TO REPLAY");
        delay(100);
      }
      //-------------------------------------
      record_note(pushing_note,starttime);
      //--------------------------------------
      debug_log_shownote(num_note-1);
      //--------------------------------------
      mem_note = pushing_note;
    }
    else if(!(digitalRead(PIN_C)==HIGH && digitalRead(PIN_D)==HIGH && digitalRead(PIN_E)==HIGH && digitalRead(PIN_F)==HIGH && digitalRead(PIN_G)==HIGH)){
      pushing_note = 0;
      int count;
      count = !digitalRead(PIN_C)+!digitalRead(PIN_D)+!digitalRead(PIN_E)+!digitalRead(PIN_F)+!digitalRead(PIN_G);
      if(digitalRead(PIN_C)==LOW){
        pushing_note = pushing_note + NOTE_C4;
      }
      if(digitalRead(PIN_D)==LOW){
        pushing_note = pushing_note + NOTE_D4;
      }
      if(digitalRead(PIN_E)==LOW){
        pushing_note = pushing_note + NOTE_E4;
      }
      if(digitalRead(PIN_F)==LOW){
        pushing_note = pushing_note + NOTE_F4;
      }
      if(digitalRead(PIN_G)==LOW){
        pushing_note = pushing_note + NOTE_G4;
      }
      pushing_note = pushing_note/count;
        
      tone(SPEAKER,pushing_note);
      
      int memcount = count;
      int checkcount = count;
      while(checkcount==memcount){
        checkcount = !digitalRead(PIN_C)+!digitalRead(PIN_D)+!digitalRead(PIN_E)+!digitalRead(PIN_F)+!digitalRead(PIN_G);
      }
      
      if(mem_note!=pushing_note){
        //-------------------------------------
        record_note(pushing_note,starttime);
        //--------------------------------------
        debug_log_shownote(num_note-1);
        //--------------------------------------
      }
      mem_note = pushing_note;  
    }
  }
//-----------------------------------------------------------------------Replay Mode----------------------------------------
  else{
    digitalWrite(LED_BUILTIN,LOW); // Show status replay mode
    for(int i=1;i<num_note;i++){
      if(piano[i].note!=0){
        tone(SPEAKER,piano[i].note);
        delay(piano[i].timer);
      }
      else{
        noTone(SPEAKER);
        delay(piano[i].timer);
      }
      noTone(SPEAKER);
      //--------------------------------------
      debug_log_shownote(i);
      //--------------------------------------
    }
    Serial.println("-------------------------------->END REPLAY");
    while(digitalRead(PIN_MODE)==HIGH){
      // waiting Mode Push
    }
    if(digitalRead(PIN_MODE)==LOW){
      int starttime = millis();
      while(digitalRead(PIN_MODE)==LOW){
        //timer push mode button
      }
      if(millis()-starttime>=3000){
        mode_replay = false;
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

//-----------------------------------------------------------------------function-------------------------------------------
void debug_log_shownote(int indexnote){
  Serial.print(piano[indexnote].note);
  Serial.print("\t< note -- time >\t");
  Serial.println(piano[indexnote].timer);
}
void record_note(int pushing_note,int starttime){
  piano[num_note].note = pushing_note;
  piano[num_note].timer = millis()-starttime;
  num_note++;
}
void clear_record(){
  for(int i=0;i<num_note;i++){
    piano[i].note = 0;
    piano[i].timer = 0;
  }
  num_note = 0;
}
