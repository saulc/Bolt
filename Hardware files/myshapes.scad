
 /*
  * Copyright [2017] [Saul Castro]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    
        http://www.apache.org/licenses/LICENSE-2.0
    
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

  */
  
  
/*==================================================
==================	Extention of basic shape with shot sintax =====================
==================================================*/
//all shapes centered at 0, 0 for easy rotation

// r prefix rounded
//rrc(10, 20 ,30, 4, 5);
//sp(11, 44);

fn = 50;

module c(w, l, d){
    translate([0,0,0]) cube([w, l, d], center=true);
}

module cy(d, h){  
    translate([0,0,0])    cylinder(d=d, h=h, $fn=fn, center=true);
}
module cy(d, h, f){  
    translate([0,0,0])    cylinder(d=d, h=h, $fn=f, center=true);
}

module sp(d, f){  
    translate([0,0,0])    sphere(d=d, $fn=f);
}

module rcy(d, h, c, fn){
	minkowski(){
			sp(c);
			cy(d-c, h-c, fn);
        }
}

module rc(w, l, d, c){
    hull(){
            translate([w/2-c/2,l/2-c/2,0]) cy(c, d);
            translate([w/2-c/2,-l/2+c/2,0]) cy(c, d);
            translate([-(w/2-c/2),l/2-c/2,0]) cy(c, d);
            translate([-(w/2-c/2),-l/2+c/2,0]) cy(c, d);
    }
    
}

module rrc(w, h, d, c, s){
          translate([0,0,0])  minkowski(){
			sp(s);
			rc(w-s, h-s, d-s, c);
        }
}



module slot(d, h, l){
    hull(){
        holes(d, h, l);
    } 
}

module cn(d, d2, h ,h2  , ff = fn ){ 
         rotate([0,0,90])  hull(){ 
                 translate([ 0, 0, h/2])   cy(d2, h, ff);  
                 translate([ 0, 0, h2/2])  cy(d, h2, ff); 
          }
}
                   

  
module cs(d, d2, h, x ){
    
                  for(i=[-1,1])  translate([ i*x/2, 0, 0])  cn(d, d2, h/3, h);
}

module holes(d, h, x, ff = fn){
    
                  for(i=[-1,1])  translate([ i*x/2, 0, h/2])  rotate([0,0,90]) cy(d, h, ff); 
}
                   
  


