
use <myshapes.scad>


fn = 150;

id = 22;
w = 2;
z = 9;
y = id*.4; //spacing
x = 7; //offset Shape
n = 3;

r = 24;
motor = 8.5+.6;
 
//   cy(40, 1, fn);
wan();
//tor(id, id);
 module wan(){
     difference(){
     union(){
         
             translate([0, 0, z/2 ]) cy(8, z, fn);
         for(i=[0:n-1]) rotate([0,0,i*360/n]) translate([0, y,0])  pt(); //pr();
             
     }
             translate([0, 0, z/2 ]) cy(1.6, z+2, fn); 
 }
 }
module pt(){
            difference(){
            tor(id+w, r, z);
            tor(id, r, z+1); 
        rotate([0,0,-32.5])   translate([0, -id*.68, -3]) cn(id, id*.84, z*1.75, 2);
            }
            
}

module pr(){
            difference(){
            cut(0,w);
            cut(1);
        #rotate([0,0,-31])   translate([0, -id*.56, -3]) cn(id, id*.8, z*1.65, 2);
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

module tor(d, r, z){
    intersection(){ 
        translate([-r, 0, 0])  rotate([90,0,0])  
    rotate_extrude(angle = 60, convexity= 1, $fn=fn)
        projection()  translate([r, 0, 0]) cy(d, 1, fn);
          translate([0, 0, z/2]) cy(id*2, z, fn);
        }
}



  
 