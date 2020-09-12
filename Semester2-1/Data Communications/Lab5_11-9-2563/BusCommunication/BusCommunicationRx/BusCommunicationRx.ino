#include<SoftwareSerial.h>

SoftwareSerial mySerial(10, 11);

bool enteredClientId = false;
bool enteredDesId = false;
String clientId;
String desId;

void setup() {
  Serial.begin(115200);
  mySerial.begin(57600);

  //Set Client ID
  Serial.println("Enter ID : ");
  while (!enteredClientId) {
    if (Serial.available()) {
      clientId = Serial.readStringUntil('\n');
      Serial.println(">> My Id : " + clientId);
      enteredClientId = true;
    }
  }

  //Set Des ID
  Serial.println("Enter Des ID : ");
  while (!enteredDesId) {
    if (Serial.available()) {
      desId = Serial.readStringUntil('\n');
      Serial.println(">> Reciver Id : " + desId);
      enteredDesId = true;
    }
  }
  Serial.println("============================");
}

char flag = ':';
bool canSend = true;
long timer = 0;
String sendFrame = "";
String recieveFrame = "";

void loop() {
  //===================== Send Timer ===============//
  if (!canSend && millis() - timer >= 5000) {
    Serial.println(">> Sending Status : TimeOut");
    Serial.println(">> Try to send again!");
    Serial.println("============================");
    canSend = true;
    sendFrame = "";
    flushSerial();
  }

  //===================== Send =====================//
  if (canSend && Serial.available()) {
    String src = clientId;
    String des = desId;
    bool isArkFrame = false;

    //Insert escape charecter into data
    String inputData = Serial.readStringUntil('\n');
    String data = "";
    for (int i = 0; i < inputData.length(); i++) {

      if (inputData[i] == flag) {
        data += '/';
        data += inputData[i];
      }
      else {
        data += inputData[i];
      }
    }
    int sum = 0;
    for (int i = 0; i < data.length(); i++) {
      sum += data[i];
    }

    //Make dataFrame for send
    sendFrame = des + flag + src + flag + String(isArkFrame) + flag + data + flag + String(sum) + "#";

    //Send dataFrame
    Serial.println("Send frame : " + sendFrame);
    Serial.println(">> Display Input Data : " + inputData);
    Serial.println("============================");
    for (int i = 0; i < sendFrame.length(); i++) {
      mySerial.write(sendFrame[i]);
    }
    canSend = false;
    timer = millis();
  }

  //===================== Recieve ==================//
  if (mySerial.available()) {
    String des = mySerial.readStringUntil(':');
    String src = mySerial.readStringUntil(':');
    String isArkFrame = mySerial.readStringUntil(':');

    String data, sum, arkStatus;
    //Recieved dataFrame
    if (isArkFrame == String(false)) {
      data  = "";
      while (mySerial.peek() != flag) {
        if (mySerial.peek() == '/') {
          data += char(mySerial.read());
        }
        data += char(mySerial.read());
        delay(1);
      }
      //Remove end flag of data from mySerial
      mySerial.read();

      sum = mySerial.readStringUntil('#');
      recieveFrame = des + flag + src + flag + isArkFrame + flag + data + flag + sum + "#";

      if (des == clientId) {
        int calSum = 0;
        for (int i = 0; i < data.length(); i++) {
          calSum += data[i];
        }
        //Accept dataFrame
        if (String(calSum) == sum) {
          Serial.println("Recieve frame : " + recieveFrame);
          Serial.println("Header : " + des + src);
          Serial.println("Data : " + data);
          Serial.println("Sum : " + sum);
          Serial.println("Received");
          Serial.println("----------------------------");

          //Remove '/' from data for display outputData
          for (int i = 0; i < data.length(); i++) {
            if (data[i] == '/') {
              data.remove(i, 1);
            }
          }
          Serial.println(">> Display Output Data >> " + data);
          Serial.println("----------------------------");

          //Make Ark dataFrame for response
          bool isArkFrame = true;
          boolean arkStatus = true;
          String arkFrame = desId + flag + clientId + ":" + String(isArkFrame) + flag + String(arkStatus) + "#";

          //Send Ark dataFrame
          Serial.print("Send Ark Status : ");
          Serial.println(arkStatus);
          Serial.println("============================");
          for (int i = 0; i < arkFrame.length(); i++) {
            mySerial.write(arkFrame[i]);
          }
        }
        else {
          Serial.println("Drop frame : " + recieveFrame);
          Serial.println("Header : " + des + src);
          Serial.println("Data : " + data);
          Serial.println("Sum : " + sum);
          Serial.println("Droped");
          Serial.println("----------------------------");

          //Make Ark dataFrame for respone
          bool isArkFrame = true;
          boolean arkStatus = false;
          String arkFrame = desId + flag + clientId + flag + String(isArkFrame) + flag + String(arkStatus) + "#";

          //Send Ark dataFrame
          Serial.print("Send Ark Status : ");
          Serial.println(arkStatus);
          Serial.println("============================");
          for (int i = 0; i < arkFrame.length(); i++) {
            mySerial.write(arkFrame[i]);
          }
        }
      }
    }

    //Recieved arkFrame
    else {
      arkStatus = mySerial.readStringUntil('#');
      recieveFrame = des + flag + src + flag + isArkFrame + flag + arkStatus + "#";

      //Check for Ark respone
      if (!canSend) {
        Serial.print("Recieved Ark Status : ");
        Serial.println(arkStatus);
        Serial.println("============================");

        if (arkStatus == String(true)) {l
          String sendFrame = "";
          canSend = true;
        }
        else {
          //Send dataFrame
          Serial.println("Repeat Send Frame : " + sendFrame);
          Serial.println("============================");
          for (int i = 0; i < sendFrame.length(); i++) {
            mySerial.write(sendFrame[i]);
          }
        }
      }
    }
  }
}

void flushSerial() {
  while (Serial.available()) {
    uint8_t tmp = Serial.read();
  }
}
