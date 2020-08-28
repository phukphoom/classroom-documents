#include<SoftwareSerial.h>

SoftwareSerial mySerial(10, 11);

bool enteredId = false;
String clientId;

void setup() {
  Serial.begin(9600);
  mySerial.begin(57600);

  //Set Client ID
  Serial.println("Enter ID : ");
  while(!enteredId){
    if(Serial.available()){
      clientId = Serial.readStringUntil('\n');
      Serial.println("Your Id : " + clientId);
      enteredId = true;
    }
  }
}

void loop() {
  //===================== Send =====================//
  if (Serial.available()) {
    String src = clientId;
    String des = Serial.readStringUntil(':');
    String data = Serial.readStringUntil('\n');

    //Pack Package
    String package = des + ":" + src + ":" + data + "\0";

    //Send Package
    for (int i = 0; i < package.length(); i++) {
      mySerial.write(package[i]);
    }
    Serial.println("Me:" + data);
  }

  //===================== Recieve ==================//
  if (mySerial.available()) {
    String des = mySerial.readStringUntil(':');
    String src = mySerial.readStringUntil(':');
    String data = mySerial.readStringUntil('\0');
    String package = des + ":" + src + ":" + data + "\0";
     
    if(des==clientId){
      //Get Package
      Serial.println(src +":"+ data);
    }
    else{
      //Forward Package
      Serial.println("Package -> " + package + " Forward to " + des);
      for (int i = 0; i < package.length(); i++) {
        mySerial.write(package[i]);
      }
    }
  }
}
