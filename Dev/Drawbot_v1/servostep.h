#ifndef servostep_h
#define servostep_h
#include "Arduino.h"
#include <Servo.h>

//#include "PinChangeInterrupt.h"
/*
 * Code keys v1 - 2022/8/8 Saul C.
 * button dobounce + double tap (needs work)
 * external and pinchange interupt pints only.
 * nano/micro only. not working for esp32. (tap timer only..)
  */
  
class servostep{
  public: 
  
     servostep(int p , int sp) { //, void* callback,  bool isinterupt){
      pin = p;
      spin = sp;
//      clickCallback = callback; 
//      isInterupt = isinterupt;
     }
    ~servostep(){}
    
    void ini(){
      pinMode(pin, INPUT_PULLUP); 
      mservo.attach(spin);
      //no press n hold, alternate version for 'gaming response'
//      if(isInterupt) attachInterrupt(digitalPinToInterrupt(pin), clickCallback, CHANGE );  
//      else attachPinChangeInterrupt(digitalPinToPinChangeInterrupt(pin), clickCallback, CHANGE); 
      }
     int getPin(){ 
        return pin;
     }
      
    //basic debounce//maybe add a double tap?
    //double tap still triggers single tap, 
    //solutions, wait for it or undo it. 
//    for now use 'non conflicting' double taps.
    long tap(){
      long temp  = millis() - lastClick; 
      if(temp  > clickDelay){ 
        rpm = 60000000/(32*(lastDur + flipDur));
//        rpm = lastDur;
        lastDur = flipDur;
        flipDur = temp;
      
        if(tik++ > 10000) tik = 0;
        if(tik >= steps-1) stopservo();
        
        if(tik % 64 == 0) rotations++;
//        pauseservo(3333);
        lastClick = millis();   
      }
        return tik; 
    } 
    int getTiks(){ return tik; }
    int getRotations(){ return rotations; }

    long getRpm(){
      return rpm;
    }
    void pauseservo(int p){ 
      mservo.write(90);
      delay(p);
      mservo.write(90+4*dir);
    }
    void stopservo(){ mservo.write(90); }

    int go(int s){
      steps = s;
      tik = 0;
      dir = (s > 0 ? 1:-1);
      mservo.write(90+4*dir);
      return s - tik;
    }
    
  private:
    int steps = 0;
    
    Servo mservo;
    int spin = 0;
    int dir = 0;
    int tik = 0;
    int rotations = 0;
    int  rpm = 10;
    int pin = 0;
    long flipDur = 0, lastDur = 0;
    long lastClick = 0; // for 3 interupt micros.
    long clickDelay = 21;  //reduce for "gaming" response, false/extra key taps ok.
    bool isInterupt;    //3 buttons isn't enough.....this may not work
    void   *clickCallback; //just need to save a pointer and the int lib will do the rest
    long doubleTapDelay = 350;  
};    
#endif
