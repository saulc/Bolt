

#include <Servo.h>

Servo servo0;
Servo servo1; 
#include "irendstop.h"

void sensorChange();
irendstop rpm0(3, sensorChange, true);
int val = 14;
const int ledPin = 13;   
//volatile int tics = 0, lr = 0;
volatile long lt = 0;
volatile int tic = 1;

void sensorChange(){ 
//  if(tics % 32 == 0){
//    state = !state;
//    if(lr++ > 10) lr = 0;
  tic = rpm0.tap(); 
//  }
//  lt = rpm0.tap();
//  tics++;
//   Serial.print(" tap = ");
//  Serial.print(t);
  
}
void setup() {
  rpm0.ini();
  // put your setup code here, to run once:
//  pinMode(ledPin, OUTPUT);
  servo0.attach(6);
  delay(100);
  servo1.attach(5);
  delay(100);
  Serial.begin(9600);
   Serial.println("ACME tone wheel test ");
   
   servo1.write(  90+11 );
    delay(311);  
   servo1.write(  90 );
    delay(311);  
   servo1.write(  90-7 );
    delay(311);  
//   
//     int s = 89+val; 
//   servo0.write( 90);
//   servo1.write(  90 );
//    delay(11);  
//   servo1.write(  s );
//    delay(11);  
//   servo0.write(  s );
//    delay(311);  
//    val *= -1;
//    s = 89+val; 
//   servo1.write(  s );
//    delay(11);  
//   servo0.write(  s );
//    delay(311);  
}

void loop() {

//  digitalWrite(13, state);
  
//   int s = map(val, 0, 1023, 0, 180); 
  int s = 90+val;
   if(tic%32<=1) {
    val *= -1;
   servo0.write( 90);
//   servo1.write(  90 );
    delay(311);  
//   servo1.write(  s );
   servo0.write(  s );
   tic++;
   }else{
   servo0.write(  s );
//   servo1.write(  s );
   }
//   if(lt<55) {
//    
//   servo0.write( 90);
//    delay(311);  
//   servo0.write(  s );
//   }
   long rpm = rpm0.getRpm();
   
   Serial.print("speed = ");
  Serial.print(s);
   Serial.print(" tic = ");
  Serial.print(rpm0.getTiks());
   Serial.print(" rotations = ");
  Serial.print(rpm0.getRotations());
   Serial.print(" lt = ");
  Serial.print(lt);
   Serial.print(" rpm = ");
  Serial.println(rpm);
}
