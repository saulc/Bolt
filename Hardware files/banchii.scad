


use <servo mount 37g.scad>
use <myshapes.scad>
   
hole = 7.5;   
hh = 3.5;
 hd = 33;

fn = 50;

//%cy(110, 1, 50);  


a = 24;
d = 4;
y =7;
z = 14;

//cy(111, 1, fn);
 
//            translate([  13, 80, 36])
chas();
 
//mtr();
//            translate([  0, 55, 6]) rotate([90,90, 0])  
//pv();
//
//            translate([  0, 52, 6]) rotate([90,0, 0])  
//
//rin();
//t();

module t( ){
     difference(){ 
         translate([  0, 0,2])   cy( 12, 4, 6);  
            translate([  0, 0,4])   cy( 7.4, 24, fn);
        }
    }
 
    
module pv( ){
     difference(){
         union(){
            translate([  0, 0,6])   cy( 22, 12, fn); 
             hull(){
            translate([  0, 0,2])   cy( 25, 4, fn); 
            translate([  0, -15,2])   cy( 11, 4, fn); 
             }
         }
            translate([  0, -16,2])   cy( 3.2, 11, fn); 
            translate([  0, 0,4])   cy( 7.4, 24, fn);
            translate([  0, 0, -1]) rotate([0,0, 90])  holes(3.1, 24, 15);
        }
    }
    
    
 module mtr( ){
     difference(){
     union(){
//            translate([  0, 0,0])   link();
         translate([  0, 0, 22]) rotate([0,180, 0])    cn(62+3, 60+3, 22, 11);
            
         translate([  0, 36, 6]) rotate([90,0, 0])  rc(22, 12, 11, 3);
        }
         translate([  0, 42, 6]) rotate([90,0, 0])  holes(3.1, 11, 15);
         translate([  0, 22, 0]) rotate([90,0, 0])  cy(2, 44, fn);
     difference(){
            translate([  0, 0,23]) rotate([0,180, 0])    cn(62, 60, 24, 11);
         
            translate([  0, 0,-1])   cy( 12, 24, 6);
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120])   translate([  0, 24]) c(3.5, 40, 11);
        }
            translate([  0, 0,4])   cy( 7.5, 24, fn);
    }
}

 module chas( ){
     difference(){
     union(){
//        for(i=[0:2]) translate([0,i==0? -11:0 ,0]) rotate([0,0, i*120]) link();
            
            hull(){
             translate([  22, 0, d/2])  rc(11, 22, d, d);
             translate([ -9, 0, d/2])  rc(30, 55, d, d);
            }
//              translate([  0, -y, 0]) rotate([0,0, 90]) slot(24, 8, 22);
    }
//              translate([  0, -y, -1]) rotate([0,0, 90]) slot(hole, 22, 22);
//              translate([  0, -y, 5]) rotate([0,0, 90]) slot(17.7, z, 22);
    
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120+60])  
                            translate([   20, 0,z/2-1]) cy(3.1, z, fn); 
        
        
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120])  
                            translate([   a/2+2, 0,z/2-1]) cy(a, z, 6); 
        
              for(i=[-1,1])  translate([  -10, -20*i, d/2]) rotate([90*i,0, 0])  holes(3., 24, 20);
    }
     
 }
 
 module link( ){
     dd = 40; 
     ee = 40;
     difference(){
             union(){ 
                 hull(){
                    translate([  0, ee-33, d/2 ])  cy(a-11, d, 6);
                    translate([  0, ee, d/2 ])    cy(a , d, 6);
                 }   
                    }
              
        }
}
 

  
	