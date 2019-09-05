#define Bgreen  10    //<-right Button
#define Byellow 11
#define Bred    12
#define green   3     //<-right LED
#define yellow  4
#define red     5

bool greenstatus   = false;
bool yellowstatus  = false;
bool redstatus     = false;

long greentimer;
long yellowtimer; bool yellowbegin = false;
long redtimer;


void setup (){
  pinMode(Bgreen,INPUT_PULLUP);
  pinMode(Byellow,INPUT);
  pinMode(Bred,INPUT);
  pinMode(green,OUTPUT);
  pinMode(yellow,OUTPUT);
  pinMode(red,OUTPUT);
  
  digitalWrite(green,LOW);
  digitalWrite(yellow,LOW);
  digitalWrite(red,LOW);
  
  Serial.begin(9600);
}

void loop (){
//---------------------Monitor Debug---------------------
  Serial.print(millis()-yellowtimer); // Display millis()-yellowtimer to Debuging
  Serial.print(" | Red 1 : ");
  Serial.print(digitalRead(Bred));
  Serial.print("-");
  Serial.print(redstatus);
  Serial.print(" | Yellow 2 : ");
  Serial.print(digitalRead(Byellow));
  Serial.print("-");
  Serial.print(yellowstatus);
  Serial.print(" | Green 3 : ");
  Serial.print(digitalRead(Bgreen));
  Serial.print("-");
  Serial.println(greenstatus);
//------------------------green---------------------------//internal pullup
  if(digitalRead(Bgreen)==LOW){
    if(greenstatus==false&&redstatus==false){
      digitalWrite(green,HIGH);
      greenstatus = true;
      greentimer = millis();
    }
    else{
      digitalWrite(green,LOW);
      greenstatus = false;
    }
  }
  else{
    if(millis()-greentimer>=3000){
      digitalWrite(green,LOW);
      greenstatus = false;
    }
  }
//--------------------------yellow-------------------------//pulldown
  if(digitalRead(Byellow)==HIGH){
    if(yellowstatus==false&&redstatus==false&&greenstatus==false){
      yellowbegin = true;
      yellowtimer = millis();
    }
    /*else{
      digitalWrite(yellow,LOW);
      yellowstatus = false;
    }*/
  }
  else if(digitalRead(Byellow)==LOW && millis()-yellowtimer<=2000 && yellowbegin==true){
    if(millis()-yellowtimer<=500){
      digitalWrite(yellow,HIGH);
      yellowstatus = true;
    }
    else if(millis()-yellowtimer<=1000){
      digitalWrite(yellow,LOW);
      yellowstatus = false;
    }
    else if(millis()-yellowtimer<=1500){
      digitalWrite(yellow,HIGH);
      yellowstatus = true;
    }
    else{
      digitalWrite(yellow,LOW);
      yellowstatus = false;
    }
  }
//--------------------------red---------------------------//pullup
  if(digitalRead(Bred)==LOW){
    if(redstatus==false){
      digitalWrite(red,HIGH);
      redstatus = true;
      redtimer = millis();
    }
    else{
      digitalWrite(red,LOW);
      redstatus = false;
    }
  }
  else{
    if(millis()-redtimer>=3000){
      digitalWrite(red,LOW);
      redstatus = false;
    }
  }
//-----------------------De-bouncing------------------------  
  delay(150);
}
