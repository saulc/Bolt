


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
     pd = 44;
     dh = 24;
     dvh = 33;
     pv = 33;
     
h3 = 3.1;

//cy(111, 1, fn);
 
//            translate([  10, 66, -36])
//chas();
//test();
// add();       
// translate([  60, 0, 0])
//mtr();
//mtr22();
// translate([  -60, 0, 0])
mtr2();
//            translate([  0, 33, 6]) rotate([90,0, 0])  
//pv();
//
//            translate([  0, 52, 6]) rotate([90,0, 0])  
//rin();
//t();

//            translate([  0, 33, 4]) rotate([-90,0, 0])  
//ser();

//arm();

//barm(100);

module barm(l, d=4){  
    c = 9;
	difference(){
		union(){ 
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c+2    , d, 6);  
                for(i=[0])  translate([ 0, i*10 , d/2])   cy(  c+2    , d, 6);  
                translate([0,0,d/2]) rc(5, l, d, 2);  
		} 
				for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  h3 +.4, d*2, fn);   //   
				for(i=[0])  translate([ 0, i*10 , d/2])   cy(  h3 +.4, d*2, fn);   //   
				for(i=[0])  translate([ 0, i*10 , d+1.2])  mirror([0,0,1]) cn(  6,h3 ,  4, 2);   //   
				for(i=[-1,1])  translate([ 0, i*l/2 , d+1.2])  mirror([0,0,1]) cn(  6,h3 ,  4, 2);   //   
	}
}    

module test( ){
     difference(){ 
         union(){
              translate([0,-d/2 ,15/2+d]) rotate([90,0, 0])    cy(15, 6, 6); 
             
              translate([0,0 ,3]) rotate([0,0, 0])    cy(11, 6, 6); 
             
         for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120+60])  
                            translate([   10, 0,d/2]) c(22, 4, d);
         for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120+60])  
                            translate([   20, 0,d/2]) cy(11, d, 6);  
         } 
         for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120+60])  
                            translate([   20, 0,z/2-1]) cy(3.1, z, fn); 
         
         for(i=[0:2]) rotate([180,0, i*120+60]) translate([20,0 ,-d-1.2])  cn(7, 3.1, 4, 2); 
         
              translate([0,0 ,15/2+d]) rotate([90,0, 0])    cy(3.1, z, fn); 
      
     }
 }
module arm( ){
     difference(){ 
         union(){
         holes(7, d, 24);
             translate([  0, 0,d/2])  c(22, 4, d);
        }
         holes(1.5, d*2, 24);   
        translate([  12, 0,d])   cy( 3, d, fn);  
    }
}
 
module ser( ){
     difference(){
         union(){ 
             hull(){
            translate([  0, 0,2])   cy( 11, d, fn);  
            translate([  0, 23,2])   rc(32, 15, d, 4); 
             }
            translate([  0, 32 ,3])   rc(12, 6, d+2, 2); 
         } 
            translate([  0, 10,2])   cy( 17, 11, 6); 
            translate([  0, -2,4])   cy( 3.2, 24, fn); 
         
             translate([  0, 42, 3]) rotate([90,0, 0])    cy( 3.2, 24, fn); 
             translate([ 0, 24, 4])   servo();
        }
    }

module t( ){
     difference(){ 
         translate([  0, 0,2])   cy( 12, 4, 6);  
            translate([  0, 0,4])   cy( 7.4, 24, fn);
        }
    }
 
    
module pv( ){
     difference(){
         union(){
            translate([  0, 0,2])   cy( 18, 4, 6);  
             hull(){
            translate([  0, 0,2])   cy( 8, 4, fn); 
            translate([  20, 0,2])   cy( 7, 4, fn); 
             }
         }
            translate([  0, 0,4])   cy( 14.5, 4, 6);  
         
            translate([  20, 0,2])   cy( 1.5, 11, fn);  
            translate([  0, 0 ,2])   cy( 3.2, 11, fn);  
        }
    }
    
    
module add(){
     difference(){
    union(){
//            translate([  0, 0,0])   link();
         translate([  0, 0, dvh]) rotate([0,180, 0])    cn(pd+4.5, pv+3, dvh/2, dvh/4);
         
         translate([  0, 0, 0]) rotate([0,0, 0])    cn(pd+4, pv+3, dvh/2,1);
         }
         translate([  0, 0, dvh+dh-4]) rotate([0,180, 0])    cn(pd+4.4, pd+2, dh, 11); //connecting
         translate([  0, 0, dvh]) rotate([0,180, 0])    cn(pd+2, pv, dvh/2, dvh/4);
         
         translate([  0, 0, -1]) rotate([0,0, 0])    cn(pd+2, pv, dvh/2+2,2);
         
         translate([  0, pd/2+2, dvh+2]) rotate([90,0, 0])  cy(14.4, 11, 6);  //motor holder
     }
}


 module mtr2( ){
     difference(){
     union(){
//            translate([  0, 0,0])   link();
         translate([  0, 0, dh]) rotate([0,180, 0])    cn(pd+11, pd+2, 9, .4);
         
         translate([  0, 0, dh-2]) rotate([0,180, 0])    cn(pd+4, pd, dh-8, 1);
        translate([  0, 0, 0]) rotate([0,0, 0])    cn(pd+4, pd, 8, 2);
            
         translate([  0, pd/2+2, 6]) rotate([90,0, 0])  cy(14, 11, 6); 
        }
         translate([  0, pd/2+5, 6]) rotate([90,0, 0])  cy(3., 6, fn);  
         translate([  0, 22, 0]) rotate([90,0, 0])  cy(2, 44, fn);
        difference(){
         union(){
            translate([  0, 0,dh-4]) rotate([0,180, 0])    cn(pd+2, pd-2, dh-8, 1);
            translate([  0, 0,-.8]) rotate([0,0, 0])    cn(pd+2, pd-2, 9, 2);
         }
         
            translate([  0, 0,-1])  rotate([0,0, 30]) cy( 14, 24, 6); //motor holder
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120]) hull(){
            translate([  0, 24]) c(3.5, 40, 5); 
            translate([  0, 24,2]) c(1, 40, 11);
        }
    }
        translate([  0, 0, dh+1]) rotate([0,180, 0])    cn(pd+9, pd+1, 9, 1);
            translate([  0, 0,4])   cy( 8.5+.6, 24, fn);
    }
}


 module mtr22( ){
     difference(){
     union(){
//            translate([  0, 0,0])   link();
         translate([  0, 0, dh]) rotate([0,180, 0])    cn(pd+15, pd+2, 9, 1.2);
         
         translate([  0, 0, dh]) rotate([0,180, 0])    cn(pd+4, pd, dh, dh-4);
            
         translate([  0, pd/2+2, 6]) rotate([90,0, 0])  cy(14, 11, 6); 
        }
         translate([  0, pd/2+5, 6]) rotate([90,0, 0])  cy(3., 6, fn);  
         translate([  0, 22, 0]) rotate([90,0, 0])  cy(2, 44, fn);
     difference(){
        #    translate([  0, 0,dh+1]) rotate([0,180, 0])    cn(pd+2, pd-2.6, dh+2, dh-4);
         
            translate([  0, 0,-1])  rotate([0,0, 30]) cy( 14, 24, 6); //motor holder
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120]) hull(){
            translate([  0, 24]) c(3.5, 40, 5); 
            translate([  0, 24,2]) c(1, 40, 11);
        }
    }
      translate([  0, 0, dh+1]) rotate([0,180, 0])    cn(pd+15, pd+1, 9, 1);
            translate([  0, 0,4])   cy( 8.5+.6, 24, fn);
    }
}

 module mtr( ){
     difference(){
     union(){
//            translate([  0, 0,0])   link();
         translate([  0, 0, dh]) rotate([0,180, 0])    cn(pd+11, pd+2, 9, 2);
         
         translate([  0, 0, dh]) rotate([0,180, 0])    cn(pd+4, pd+2, dh, 11);
            
         translate([  0, pd/2+2, 6]) rotate([90,0, 0])  cy(14, 11, 6); 
        }
         translate([  0, pd/2+5, 6]) rotate([90,0, 0])  cy(3., 6, fn);  
         translate([  0, 22, 0]) rotate([90,0, 0])  cy(2, 44, fn);
     difference(){
            translate([  0, 0,dh+1]) rotate([0,180, 0])    cn(pd+2, pd, dh+2, dh/2);
         
            translate([  0, 0,-1])  rotate([0,0, 30]) cy( 14, 24, 6); //motor holder
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120]) hull(){
            translate([  0, 24]) c(3.5, 40, 5); 
            translate([  0, 24,2]) c(1, 40, 11);
        }
    }
        translate([  0, 0, dh+1]) rotate([0,180, 0])    cn(pd+9, pd+1, 9, 1);
            translate([  0, 0,4])   cy( 8.5+.6, 24, fn);
    }
}

 module chas( ){
     difference(){
     union(){
//        for(i=[0:2]) translate([0,i==0? -11:0 ,0]) rotate([0,0, i*120]) link();
            
            hull(){
             translate([  22, 0, d/2])  rc(11, 22, d, d);
             translate([ -9, 0, d/2])  rc(22, 70, d, d);
                            translate([  -13, 0,d/2]) rotate([0,0,90]) cy(a, d, 6); 
            }
//              translate([  0, -y, 0]) rotate([0,0, 90]) slot(24, 8, 22);
    }
//              translate([  0, -y, -1]) rotate([0,0, 90]) slot(hole, 22, 22);
//              translate([  0, -y, 5]) rotate([0,0, 90]) slot(17.7, z, 22);
    
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120+60])  
                            translate([   20, 0,z/2-1]) cy(3.1, z, fn); 
        
        
        for(i=[0:2]) translate([0,0 ,0]) rotate([0,0, i*120])  
                            translate([   a/2+2, 0,z/2-1]) cy(a, z, 6); 
        
              for(i=[-1,1])  translate([  -10, -30*i, 3.2])     c(12.5, d+2.5, 4); 
       translate([  -10,0,-2])  rotate([0,0, 90]) holes(3.2, 24, 60);
//              for(i=[-1,1])  translate([  -10, -25*i, -1])    holes(3., 24, 20);
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
 

  
	