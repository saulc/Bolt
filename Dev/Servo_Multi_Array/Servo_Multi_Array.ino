 
#include <Servo.h>
 /*
  * Multi servo array example
  * pins[0] - pins[number of servos  - 1]
  * 0 -> s.length-1
  */

int pins[] = {9, 10, 11, 12};
Servo s[4];  

void setup() {
  Serial.begin(115200); 

  
  for(int i=0;i<4; i++)
    s[i].attach(pins[i]); 

    test();
}
void ser(int id, int v){
  if(id >= 4 or id < 0) return;
  if(v < 0 or v > 180) return;
   s[id].write(v);     
}

void test(){
    for(int i=0;i<4; i++){
      ser(i, 90);
    }
    delay(111);
    for(int i=0;i<4; i++){
      ser(i, 99);
      
    delay(1111);
    }
    delay(111);
    for(int i=0;i<4; i++){
      ser(i, 81);
    delay(1111);
    }
    delay(111);
}

void process(String dat){
  Serial.print("Input: ");
  Serial.println( dat);
  char in[] = {'a', 'b', 'c', 'd', 'e', 'f'};
   for(int i=0;i<5; i++){
    int st = dat.indexOf(in[i]);
    int en = dat.indexOf(in[i+1]);
      String v = dat.substring(st+1, en); 
      int vi = v.toInt();
  Serial.print(i);
  Serial.print(" : ");
  Serial.println( vi);
      ser(i, vi);
  }
}
void loop() { 
  delay(1111);
  test();
}
