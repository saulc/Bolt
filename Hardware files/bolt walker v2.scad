


use <myshapes.scad>
 
 /*
		 9g servo mount . m2 inserts
 */
  
z =4;
c = 9;
p = 5;

  hd = 28;
  
    h2 = 2.2; 

fn = 150;

//%cy(110, 1, 50);  
  
// !arm(24);
//! lg();
          for(j=[-1,1])      for(i=[-1,1])  translate([  i*46.5,28*j, 13.5])   rotate([ 90 , 0, 0]) {
 lg();
            translate([ 10, 0 ,-z])  rotate([ 0 , 0, 90])   arm(  20);
          }
//          for(j=[-1,1])      for(i=[-1,1])  translate([  i*15,25*j, 0])   rotate([ 0 , 0, 90]) 
 
  translate([ -24, 0, 0])  
  mnt2();
//  translate([ 0, 0, z/2])    mnt();
// frame();
 
 
module mnt2(){ 
	difference(){
        union(){
            hull(){
//               translate([0, -10.5, p/2])    rc(38, 3,p, 2);
//               translate([ 0, 0, z/2])    rc(33, 18, z, 2);
                for(i=[-1,1])  translate([  0,i*15, 0])    holes(22, z, 24, 6);
                  } 
                
                 translate([  -22.5,0 ,  p/2])   rotate([ 90 , 0, 0])  cy(p+.8, 56, 6);
        }    
            
                 translate([  -22.5,0 ,  p/2])   rotate([ 90 , 0, 0])  cy(2, 59, fn);
            for(i=[-1,1])  translate([  0,i*17, 0]) {
                ms();
                msp();
            }
             
            for(i=[-1,1])  translate([  0,i*4, 0])    msp();
//           hull()   translate([ 0, 0, -2])   holes(11, z*2, 18, 6);  
            
           hull()   translate([ 18, 0, 2])  rotate([ 0 , 0, 90])   holes(5, z*2, 11, 6); 
    } 
}

module frame(){ 
	difference(){
        union(){
            hull(){
//               translate([0, -10.5, p/2])    rc(38, 3,p, 2); 
               for(i=[-1,1])  translate([ 0, i*12])   holes(22, z, 30, 6);
                  } 
        }    
           
           for(i=[-1,1])   translate([15*i, 0, 0])    rotate([ 0 , 0, 90])  msp();
    } 
}

module msp(){
    
              translate([ 0, 0, -1])   holes(h2, z*2, 36);
              translate([ 0, 0, 2])   holes(5.5, z, 36, 6); 
        
           hull()   translate([ 0, 0, -2])   holes(7, z*2, 18, 6); 
}

module hb(v=0){
    
   hull(){
          translate([-4,  0, 2])  rotate([ 0 , 0, 30])   cy(7-v, 4, 6);
            
   translate([0, 0, 0])    rotate([ 0 , 0, 90])   slot(7-v/2, 4, 20);
   }
   }

module ms(){
        union(){
                 for(i=[-1,1])  translate([  0, i*12.5/2,-1])  holes(1.8, 11, 16);
            difference(){
                  translate([ 0, 0, 4])    rc(28, 16, 3, 7); 
                 for(i=[-1,1])  translate([  0, i*12.5/2,1])  holes(4.4, 4, 16, 6);
            }
        } 
}

module mnt(yy = 0){ 
	difference(){
        union(){
            hull(){
//               translate([0, -10.5, p/2])    rc(38, 3,p, 2);
               translate([ 0, 0, z/2])    rc(33, 18, z, 2);
                holes(11, z, 33, 6);
                  } 
        }    
            
            translate([ 0, 0, 0])   ms();
        msp();
    } 
}

module lg(){
    d = 4;
    l = 33;
    k = 7;
    difference(){
        union(){  
                for(i=[-1, 0, 2])  translate([ 0, i*l/3 , d/2])   cy(  k    , d, 6);  
                    
      
          translate([0,l/3/2, d/2]) c(d, l*1, d);
        }
       translate([0,l/3, -d/2])    rotate([0,0,90])  slot(1.8, d*2, l/2-3);
       translate([0,-l/3/2, -d/2])    rotate([0,0,90])  slot(1.8, d*2, l*.08);
        
                for(i=[-1, 0, 2])  translate([ 0, i*l/3 , d/4])   cy(  2.5    , d*2, fn);  
                for(i=[-1, 2])  translate([ 0, i*l/3 , d])   cy(  4    , d, fn);   
    }  
}
 

module arm(l, d=4){  
    c = 6;
	difference(){
		union(){ 
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c +i+1   , d, 6);  
                translate([0,0,d/2]) rc(d+.4, l, d, 2);  
                translate([ 0, -l/2 , d])   cy(  c  , d*2, 6);  
		} 
                translate([0,0,-d/2]) hull() rotate([0,0,90]) holes(2, d*2, l*.6, 6);
				for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(   (i==-1 ? 1.8:h2+.5) , d*4, fn);   
                    translate([ 0, l/2 , d+1])   cy(  4.5  , d, fn);  
	}
}    




 
 

  


	
	