


use <myshapes.scad>
 
 /*
		 9g servo mount . m2 inserts
 */
 
 w = 20 + 1; 
 x = 8 + .6; 
 y = 30;
z = 8;
c = 8;
p = 5;

  hd = 24;
  
    h2 = 3; 
    h3 = 3.3;
    h2i = 2.2; //3.7; 
    h3i = 5.2; 

fn = 150;

//%cy(110, 1, 50);  
 
//sidemount();

//rotate([-90,0,0])
//smnt();
//mn2();

//arm(24);
//tmnt();

rin();
module rin( ){
     difference(){
         union(){
            translate([  0, 0,7.5/2])   cy( 27, 7.5, fn); 
             hull(){
            translate([  0, 0,2])   cy( 27, 4, fn); 
            translate([  -13, 28,2])   cy( 6, 4, fn); 
            for(i=[-1,1])  translate([  i*10+2, 32,2])   cy( 8, 4, fn);  
            for(i=[-1,1])  translate([  i*12, 18,2])   cy( 8, 4, fn);  
             }
         }
            translate([  0, 0,6])   cy( 22.8, 22, fn); 
            translate([  0, -16,2])   cy( 3.2, 11, fn); 
            translate([  0, 0,4])   cy( 7.4, 24, fn);
            translate([  0, 0, -1]) rotate([0,0, 0])  holes(3.1, 24, 15);
         
            translate([  3, 33, -1]) rotate([0,0, 0])  holes(3.1, 24, 20);
             translate([ 0, 24, 4])   servo();
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
                  for(i=[-1,1])  translate([ 30,i*5,  p/2]) cy(11, p, fn); 
                  }    
                  translate([ 22, 0, p/2+2])   cy(8, p+2, fn);
        }    
               translate([ 22, 0, p/2])   cy(h3, p*3, fn);
        
                    for(i=[-1,1])  translate([ 30,i*5,  p/2])  cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ 30,i*5,  w/2+ 2])  cy(8, w, fn); 
            translate([ 0, 0, 5])   servo();
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
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c    , d, fn);  
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

module mnt(){ 
	difference(){
        union(){
            hull(){
               translate([ 0, 0, p/2])    rc(38, x+3, p, 2);
                  for(i=[-1,1])  translate([ i*25, 0, p/2]) cy(c, p, fn); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ 0, 0, 5])   servo();
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
 
                  translate([ 0, 0, -z])    c(w, x, w);	 
        } 
}

 
 

  


	
	