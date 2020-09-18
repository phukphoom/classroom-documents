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

bool canSend = true;
long timer = 0;

int frameNo = 0;
int arkNo = 0;

char flag = ':';
String bufferToSend = "";
String dataFrameSend = "";
String dataFrameRecieve = "";

void loop() {
  //===================== Send Timer ===============//
  if (!canSend && millis() - timer >= 5000) {
    Serial.println(">>>>>>>>>>>> Sending Status : TimeOut");
    Serial.println(">>>>>>>>>>>> Sending again!");
    //Send dataFrame
    sendFrame(dataFrameSend);
  }
  
  //===================== Send =====================//
  if (Serial.available()) {
    //Get Input into bufferToSend
    String inputData = Serial.readStringUntil('\n');
    for (int i = 0; i < inputData.length(); i++) {
      bufferToSend += inputData[i];
    }
  }
  if (canSend && bufferToSend.length() != 0) {
    String src = clientId;
    String des = desId;
    bool isArkFrame = false;
    
    //Slicing Data from Buffer
    String data = "";
    if (bufferToSend.length() < 10) {
      int num = bufferToSend.length();
      for (int i = 0; i < num; i++) {
        data += bufferToSend[0];
        bufferToSend.remove(0, 1);
      }
    }
    else {
      for (int i = 0; i < 10; i++) {
        data += bufferToSend[0];
        bufferToSend.remove(0, 1);
      }
    }

    //Insert escape charecter into data
    data = insertEscapeChar(data);
    
    //Make dataFrame for send
    String forSum = des + flag + src + flag + String(isArkFrame) + flag + frameNo + flag + data + flag;
    dataFrameSend = des + flag + src + flag + String(isArkFrame) + flag + frameNo + flag + data + flag + getSum(forSum) + "#";
    
    //Send dataFrame
    sendFrame(dataFrameSend);
    canSend = false;
  }
  
  //===================== Recieve ==================//
  if (mySerial.available()) {
    String des = mySerial.readStringUntil(':');
    String src = mySerial.readStringUntil(':');
    String isArkFrame = mySerial.readStringUntil(':');
    String data, sum;
    String recieveFrameNo, recieveArkNo;
    
    //Recieved dataFrame
    if (isArkFrame == String(false)) {
      recieveFrameNo = mySerial.readStringUntil(':');
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
      dataFrameRecieve = des + flag + src + flag + isArkFrame + flag + recieveFrameNo + flag + data + flag + sum + "#";
      if (des == clientId) {
        String forSum = des + flag + src + flag + String(isArkFrame) + flag + recieveFrameNo + flag + data + flag;
        
        //Accept dataFrame
        if (getSum(forSum) == sum && String(arkNo) == recieveFrameNo) {
          Serial.println("Recieve frame : " + dataFrameRecieve);
          Serial.println("Header : " + des + src);
          Serial.println("FramNo : " + recieveFrameNo);
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
          
          //Make ArkFrame for response
          bool isArkFrame = true;
          arkNo = (arkNo + 1) % 2;
          String arkFrame = desId + flag + clientId + ":" + String(isArkFrame) + flag + String(arkNo) + "#";
          
          //Send Ark dataFrame
          sendArk(arkFrame);
        }
        else {
          Serial.println("Drop frame : " + dataFrameRecieve);
          Serial.println("Header : " + des + src);
          Serial.println("FramNo : " + recieveFrameNo);
          Serial.println("Data : " + data);
          Serial.println("Sum : " + sum);
          Serial.println("Droped");
          Serial.println("----------------------------");
          
          //Make Ark dataFrame for respone
          bool isArkFrame = true;
          arkNo = arkNo;
          String arkFrame = desId + flag + clientId + ":" + String(isArkFrame) + flag + String(arkNo) + "#";
          
          //Send Ark dataFrame
          sendArk(arkFrame);
        }
      }
    }
    
    //Recieved arkFrame
    else {
      recieveArkNo = mySerial.readStringUntil('#');
      dataFrameRecieve = des + flag + src + flag + isArkFrame + flag + recieveArkNo + "#";
      
      //Check for Ark respone
      if (!canSend) {
        Serial.print("Recieved Ark No : ");
        Serial.println(recieveArkNo);
        Serial.println("============================");
        if (recieveArkNo == String((frameNo + 1) % 2)) {
          frameNo = (frameNo + 1) % 2;
          canSend = true;
          dataFrameSend = "";
        }
        else {
          frameNo = frameNo;
          sendFrame(dataFrameSend);
        }
      }
    }
  }
}

void sendFrame(String frame) {
  Serial.println("Send frame : " + frame);
  Serial.println("Frame No : " + String(frameNo));
  Serial.println("============================");
  for (int i = 0; i < frame.length(); i++) {
    mySerial.write(frame[i]);
  }
  canSend = false;
  timer = millis();
}
void sendArk(String frame) {
  Serial.print("Send Ark Status : ");
  Serial.println(arkNo);
  Serial.println("============================");
  for (int i = 0; i < frame.length(); i++) {
    mySerial.write(frame[i]);
  }
}
String insertEscapeChar(String data) {
  String returnBuffer = "";
  for (int i = 0; i < data.length(); i++) {
    if (data[i] == flag) {
      returnBuffer += '/';
      returnBuffer += data[i];
    }
    else {
      returnBuffer += data[i];
    }
  }
  return returnBuffer;
}
String getSum(String string) {
  int sum = 0;
  for (int i = 0; i < string.length(); i++) {
    sum += string[i];
  }
  return String(sum);
}
