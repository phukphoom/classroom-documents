#define Bgreen  10    //<-right
#define Byellow 11
#define Bred    12
#define green   3     //<-right
#define yellow  4
#define red     5

bool greenpressing = false;
bool yellowpressing = false; 
bool redpressing = false;    

bool greenstatuslight = false;
bool yellowstatuslight = false;
bool redstatuslight = false;

long greentimer;
long yellowtimer = 2000;
long redtimer;

//-----------func Prototype----------
void showmonitor (void);
void check_input (void);
void controlgreen(int);
void controlyellow(int);
void controlred(int);
void Light_on_off(bool,bool,bool);
//-----------------------------------
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
  showmonitor();
  
  check_input();
  controlgreen(3000);
  controlyellow(2000);
  controlred(3000);

  light_on_off(greenstatuslight,yellowstatuslight,redstatuslight);
  
  delay(150);//debouncing
}

//-------------func-------------------------------------------------------------------------------------------------------------
void check_input(){
  if(digitalRead(Bgreen)==LOW){
    greentimer = millis();
    greenpressing = true;
  }
  if(digitalRead(Byellow)==HIGH){
    yellowtimer = millis();
    yellowpressing = true;
  }
  if(digitalRead(Bred)==LOW){
    redtimer = millis();
    redpressing = true;
  }
}
void controlgreen (int delaytime){
   if(greenpressing==true){
    greenpressing = false;
    if(greenstatuslight==false&&redstatuslight==false){
      greenstatuslight = true;
    }
    else{
      greenstatuslight = false;
    }
   }
   else{
    if(millis()-greentimer>=delaytime){
      greenstatuslight = false;
    }
   }
}
void controlyellow (int delaytime){
   if(yellowpressing==true){
    yellowpressing = false;
    if(yellowstatuslight==false&&redstatuslight==false&&greenstatuslight==false){
      yellowstatuslight = true;
    }
    else{
      yellowstatuslight = false;
    }
   }
   else if(redstatuslight==false&&greenstatuslight==false){
    if(millis()-yellowtimer<=delaytime*1/4){
      yellowstatuslight = true;
    }
    else if(millis()-yellowtimer<=delaytime*2/4){
      yellowstatuslight = false;
    }
    else if(millis()-yellowtimer<=delaytime*3/4){
      yellowstatuslight = true;
    }
    else{
      yellowstatuslight = false;
    }
   }
}
void controlred (int delaytime){
   if(redpressing==true){
    redpressing = false;
    if(redstatuslight==false){
      redstatuslight = true;
    }
    else{
      redstatuslight = false;
    }
   }
   else{
    if(millis()-redtimer>=delaytime){
      redstatuslight = false;
    }
   }
}
void light_on_off(bool greenstatuslight,bool yellowstatuslight,bool redstatuslight){
  digitalWrite(green,greenstatuslight);
  digitalWrite(yellow,yellowstatuslight);
  digitalWrite(red,redstatuslight);
}
void showmonitor (){
  Serial.print(millis()-yellowtimer);
  Serial.print("\t|| Red 1 : ");
  Serial.print(digitalRead(Bred));
  Serial.print("-");
  Serial.print(redstatuslight);
  Serial.print("-");
  Serial.print(redpressing);
  Serial.print(" | Yellow 2 : ");
  Serial.print(digitalRead(Byellow));
  Serial.print("-");
  Serial.print(yellowstatuslight);
  Serial.print("-");
  Serial.print(yellowpressing);
  Serial.print(" | Green 3 : ");
  Serial.print(digitalRead(Bgreen));
  Serial.print("-");
  Serial.print(greenstatuslight);
  Serial.print("-");
  Serial.println(greenpressing);
}
