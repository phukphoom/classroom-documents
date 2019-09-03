#define Bgreen  10    //<-right
#define Byellow 11
#define Bred    12
#define green   3     //<-right
#define yellow  4
#define red     5

bool light[3]={false,false,false}; //0->green 1->yellow 2->red
#define greenstatus   light[0]
#define yellowstatus  light[1]
#define redstatus     light[2]

long greentimer = 0;
long yellowtimer = 0;
long redtimer = 0;


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
  Serial.print("Red 1 : ");
  Serial.print(digitalRead(12));
  Serial.print("-");
  Serial.print(light[0]);
  Serial.print(" | Yellow 2 : ");
  Serial.print(digitalRead(11));
  Serial.print("-");
  Serial.print(light[1]);
  Serial.print(" | Green 3 : ");
  Serial.print(digitalRead(10));
  Serial.print("-");
  Serial.println(light[2]);
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
      digitalWrite(yellow,HIGH);
      yellowstatus = true;
      yellowtimer = millis();
    }
    /*else{
      digitalWrite(yellow,LOW);
      yellowstatus = false;
    }*/
  }
  else{
    if(millis()-yellowtimer>=500){
      digitalWrite(yellow,LOW);
      yellowstatus = false;
    }
    else if(millis()-yellowtimer>=1000){
      digitalWrite(yellow,HIGH);
      yellowstatus = true;
    }
    else if(millis()-yellowtimer>=1500){
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

  delay(10); //bounce debug
}
