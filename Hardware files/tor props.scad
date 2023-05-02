
use <myshapes.scad>


fn = 150;

id = 20;
w = 2;
z = 7;
y = id*.4; //spacing
x = 3; //offset Shape
n = 3;

motor = 8.5+.6;
 
//   cy(40, 1, fn);
//wan();
tor(id, id);
 module wan(){
     difference(){
     union(){
         
             translate([0, 0, z/2 ]) cy(8, z, fn);
         for(i=[0:2]) rotate([0,0,i*360/n]) translate([0, y,0]) pr();
             
     }
             translate([0, 0, z/2 ]) cy(1.4, z+2, fn); 
 }
 }
module pr(){
            difference(){
            cut(0,w);
            cut(1);
        rotate([0,0,-35])   translate([0, -id*.6, -3]) cn(id, id*.72, z*1.5, 2);
            }
            
}

 module cut(zz, a=0){  
    intersection(){ 
         hull(){ 
             translate([x, 0, -z ]) cy(id+a, 2, fn);
             translate([-x, 0, z+2]) cy(id+a, 2, fn);
     }
         
          translate([0, 0, z/2]) cy(id*2, z+zz, fn);
     
 
        }
 }

module tor(d, r){
    
        projection()  translate([r, 0, 0]) cy(d, 1, fn);
}



  
 