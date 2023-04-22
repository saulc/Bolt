


use <myshapes.scad>
 
 /*
		 9g servo mount . m2 inserts
 */
 
 w = 22.5 + 2; 
 x = 12 + .6; 
 y = 33;
z = 8;
c = 9;
p = 4;

  hd = 28;
  
    h2 = 3; 
    h3 = 3.1;
    h2i = 3.6; 
    h3i = 5.2; 

fn = 150;

//%cy(110, 1, 50);  
 
//sidemount();

//rotate([-90,0,0])

//smnt();
//mn2();

//arm(24);
//tmnt();

//mn();

//piv();

//lg();
//    difference(){
//arm(24);
//          translate([0,  12, 4])   cy(7, 4, fn);
//        
//          translate([0,  12, 1])   cy(3.4, 4, fn);
//          translate([0,  0, 4])   c(3, 14, 4);
//    }

                     
             for(j=[-1, 1])   
                 for(i=[ -1, 1])  translate([45*i,j*50, 12])  rotate([ 90 , 0, 0])
                 mirror([0, 0, j==-1?0:1]) {
//          translate([25*i,0, 6])  mnt();
                  translate([ 15*i, 28, -2])     rotate([ 0 , 0, 90+10*i]) arm(20);
                        translate([ 25*i, 30, -6])       lg();
                 }
//
        for(i=[-1, 1])  translate([45*i , 0, 10]) mirror([i>0?1:0, 0, 0]) 
fr();
//               translate([34, 0, 2]) 
//  rotate([ 0 , 90, 0])   
//hinge();
//lg();
          
module fr(){
             for(j=[-1, 1])   translate([0,j*50, 12])  rotate([ 90 , 0, 0])
                 mirror([0, 0, j==1?0:1]) {
          translate([0,0, 6])  mnt();
                 }
    difference(){
        union(){
        hull(){
            for(i=[-1, 1])  translate([0, 32*i , 0])  holes(24, 4, 40, 6);
        }
        
//          translate([40,0, 14])   rotate([ 90 , 0, -90]) mnt(5);
        hull(){
            for(i=[-1, 1])  translate([2, 17*i , 0])  holes(24, 4, 55, 6);
        }
    }
   translate([34, 0, 2])   hb();
           
               translate([34, 0, -1])  rotate([ 0 , 0, 90])  holes(3.5, 11, 15);
            for(i=[-1:1])  translate([0, 21*i , -10])  holes(3.1, 44, 62);
                
           for(i=[0:5])   rotate([ 0 , 0, i*60]) translate([0, 19   , -1]) cy(20, 11, 6);
          translate([0,  0, 0])  cy(20, 11, 6);
           for(i=[0, 2, 3, 5])   rotate([ 0 , 0, i*60+30]) translate([0, 33   , -1]) rotate([ 0 , 0, 30]) cy(20, 11, 6); 
    }
    
}

module hinge(){
    difference(){
    union(){   
   translate([.25, 0, 0])  rotate([ 0 , 0, 90])     slot(6, 11 ,20);
            
    hb(.5);
    }
               translate([0, 0, -1])  rotate([ 0 , 0, 90])  holes(3.1, 11, 15);
          translate([-3,  0, 0])  cy(3.1, 11, fn);
    
   translate([-5, 0, 8])  rotate([ 90 , 0, 90])     slot(2.5, 11, 19);
   translate([-9.5, 0, 8])  rotate([ 90 , 0, 90])     slot(3.6, 11, 19);
    }
}

module hb(v=0){
    
   hull(){
          translate([-4,  0, 2])  rotate([ 0 , 0, 30])   cy(7-v, 4, 6);
            
   translate([0, 0, 0])    rotate([ 0 , 0, 90])   slot(7-v/2, 4, 20);
   }
   }

module mnt(yy = 0){ 
	difference(){
        union(){
            hull(){
               translate([0, -10.5, p/2])    rc(38, 3,p, 2);
               translate([ 0, 0, p/2])    rc(38+yy, x+3, p, 2);
                  for(i=[-1,1])  translate([ i*25, 0, p/2]) rotate([0,0,90])  cy(c, p, 6); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ yy, 0, p])   servo();
//            translate([ -yy*3.3, -1, -1])  rotate([0,0,90])  slot(4, 9, 8);
    } 
}

module lg(){
    d = 4;
    l = 90;
    difference(){
        union(){  
                for(i=[-2, 0, 7])  translate([ 0, i*10 , d/2])   cy(  c+2    , d, 6);  
                    
      
          translate([0,25, d/2]) c(6, l*1, d);
        }
        difference(){
          translate([0,25, d]) c(3, l*.88, d);
          translate([0,0, d]) cy(c+5, d, 6);
        }
        
                for(i=[-2, 0, 7])  translate([ 0, i*10 , d/4])   cy(  3.1    , d*2, fn);  
                for(i=[-2, 7])  translate([ 0, i*10 , d])   cy(  7    , d, fn);   
    }  
}



module mn2(){ 
    of = 13;
    oo = 19;
	difference(){
        union(){
            hull(){
               translate([ of, oo+5, p/2])    cy(11, p, fn);
               translate([ 0, 0, p/2])    rc(38, x+3, p, 2);
//                  for(i=[-1,1])  translate([ i*25, 0, p/2]) cy(c, p, fn); 
                  } 
        }    
                    for(i=[-1,1])  translate([ of , oo + i*5, c/2])  cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ of , oo+ i*5, w/2+2.5])  cy(8, w, fn); 
//                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ 0, 0, 5])   servo();
    } 
}




module tmnt(){ 
	difference(){
        union(){
               translate([ 0, 0, p/2])    rc(38, x+3, p, 2);
            hull(){
               translate([ 20, 0, p/2])    rc(8, x+3, p, 2);
                  for(i=[-1,1])  translate([ 35,i*5,  p/2]) cy(11, p, 6); 
                  }    
                  translate([ -23, 0, p/2+1])   cy(11, p+2, 6);
        }    
//               translate([ -22, 0, p/2])   cy(h3, p*3, fn);
        holes(h3, p*3, 46);
        
                    for(i=[-1,1])  translate([ 35,i*5,  p/2])  cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ 35,i*5,  w/2+ 2])  cy(8, w, fn); 
            translate([ 0, 0, p ])   servo();
    } 
}


module piv(){
          translate([0,7.5, 0]) 
        arm(15);
          translate([15,0, 0]) 
        rotate([0,0,90])
        arm(30); 

        rotate([0,0,60])
        translate([10,-7,2]) c(2,24, 4);  
}

module arm(l, d=4){  
	difference(){
		union(){ 
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c+2    , d, 6);  
                translate([0,0,d/2]) rc(5, l, d, 2);  
		} 
				for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  h3- (i==-1 ? 1.1:0) , d*2, fn);   //   
	}
}    

module mn(){ 
	difference(){
        union(){
            hull(){
               translate([ 0, 22, p/2])    rc(22, x, p, x-1 );
               translate([ 0, 0, p/2])    rc(38, x+3, p, 2);
//                  for(i=[-1,1])  translate([ i*25, 0, p/2]) cy(c, p, fn); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*5, 22, c/2])  cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ i*5, 22, w/2+2.5])  cy(8, w, fn); 
//                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ 0, 0, 5])   servo();
    } 
}


module smnt(){ 
	difference(){
        union(){
            hull(){
               translate([ 0, 0, z/2])    rc(38, x+4, z, 2);
                  for(i=[-1,1])  translate([ i*25, x/4+2, c/2]) rotate([90,0,0])  cy(c, x/2, fn); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2]) rotate([90,0,0])   cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ i*25, 4-w/2, c/2]) rotate([90,0,0])   cy(6, w, fn); 
            translate([ 0, 0, 7])   servo();
    } 
}
 

module sidemount(){ 
	difference(){
        union(){
               translate([ 0, 0, x/2])    rc(38, x+2, x, 2);
            hull(){
                  for(i=[-1,1])  translate([ i*25, 0, z/2]) cy(c, z, fn); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ 0, -7, 8])   rotate([90,0,0])  servo();
    } 
}


module servo(){
        union(){
                  for(i=[-1,1])  translate([ i*hd/2, 0, 0])  cy(h2i, w, fn); 
                  translate([ 0, 0, 0])    rc(y, x, 3, 2);
 
                  translate([ 0, 0, z])    rc(w, x, w, 2);	 
        } 
}

 
 

  


	
	