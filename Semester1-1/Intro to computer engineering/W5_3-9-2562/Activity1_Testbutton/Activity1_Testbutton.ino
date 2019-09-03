bool light[3]={false,false,false};

void setup (){
  pinMode(10,INPUT_PULLUP);
  pinMode(11,INPUT);
  pinMode(12,INPUT);
  pinMode(3,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  Serial.begin(9600);
}

void loop (){
  Serial.print("Botton 1 : ");
  Serial.print(digitalRead(12));
  Serial.print(light[0]);
  Serial.print(" | Botton 2 : ");
  Serial.print(digitalRead(11));
  Serial.print(light[1]);
  Serial.print(" | Botton 3 : ");
  Serial.print(digitalRead(10));
  Serial.print(light[2]);
  Serial.println();

  if(digitalRead(12)==LOW){ //PULL UP switch
    if(light[0]==false){
      digitalWrite(5,HIGH);
      light[0]=true;
    }
    else{
      digitalWrite(5,LOW);
      light[0]=false;
    }
  }
  
  if(digitalRead(11)==HIGH){//PULL DOWN switch
    if(light[1]==false){
      digitalWrite(4,HIGH);
      light[1]=true;
    }
    else{
      digitalWrite(4,LOW);
      light[1]=false;
    }
  }
  
  if(digitalRead(10)==LOW){ //PULL UP Internal switch
    if(light[2]==false){
      digitalWrite(3,HIGH);
      light[2]=true;
    }
    else{
      digitalWrite(3,LOW);
      light[2]=false;
    }
  }

  delay(150);
}
