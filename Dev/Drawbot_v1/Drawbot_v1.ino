

#include "servostep.h"

void sensorChange();
int rs = 7, ls = 8;
int sp0 = 9, sp1 = 10;
servostep rw(rs, sp0);  //, sensorChange, true);
servostep lw(ls, sp1); 
int val = 14;
const int ledPin = 13;   
//volatile int tics = 0, lr = 0;
volatile long lt = 0;
volatile int tic = 1, tac = 0;

void lsensor(){ 
 
  tac = lw.tap(); 
  
}

void rsensor(){  
  tic = rw.tap();  
  
}
void setup() {
//  rw.ini();
  lw.ini();
  attachInterrupt(rs, rsensor, CHANGE );  
//  attachInterrupt(ls, lsensor, CHANGE );   
  
  Serial.begin(9600);
   Serial.println("ACME tone wheel test ");
   
 
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

void test(int t){
  switch(t){
    
    case 0: lw.go(-11); break;
    case 1: lw.stopservo(); break;
    case 2: lw.go(11);  break;
//    case 2: lw.go(-11); break;
//    case 3: lw.go(11); break;
  }
}

void loop() {
    static int tt = 0;
    if(tt/50000 ==0) test(tt/50000);
  if(tt++ > 200000){ tt = 0;
  
   Serial.print(tt);
   Serial.print(" -Left: ");
   Serial.print(tac);
   Serial.print(" right: ");
   Serial.println(tic);
  }
  delay(111);
}
