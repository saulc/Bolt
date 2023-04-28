


use <myshapes.scad>
 use <servo mount.scad>
 
 /*
		 9g servo mount . m2 inserts
 */
  
z =4;
c = 9;
p = 5;

  hd = 28;
  
    h2 = 2.2; 
    h3 = 3.2;
    
      x = 42;
         y = 22;

fn = 150;

//%cy(110, 1, 50);  
  
// !arm(24); 

//parm(60, 15);

//tmnt();

frame();
//  
// translate([30, -55, -z])    rotate([ 0 , 0, 90]) tmnt();
// translate([38, -70, -z*3])    rotate([ 0 , 0, -130]) arm(20);
// translate([53, -77, -z*2])    rotate([ 0 , 0, 90]) arm(46);
// 
// translate([20, -41, -z*2])    rotate([ 0 , 0, -90]) arm(20);

//darm(90, 20);

//base();
//space();
module space(){
    s = 12;
	difference(){
		union(){  
//            hull() for(i=[-1,1])  translate([0, i*y/2, 0])  holes(11, p, x, 6); 
               translate([0, 0, 0])  holes(17, s, 60, 6); 
              hull() translate([0, 0, 0])  holes(17, p, 60, 6); 
            }
               translate([0, 0, -1])  holes(h3+.5, s*2, 60); 
            
             for(i=[-1,1])  translate([i*11, 0, 0])  slot(4.4, s, 11);
             for(i=[-1,1])  translate([i*11, 0, p/2])  slot(7.4, s, 11);
    }
}

module base(){
    
	difference(){
		union(){  
            hull() for(i=[-1,1])  translate([0, i*y/2, 0])  holes(11, p, x, 6); 
                
             translate([0, y/2, 4])  cy(11, 8, 6);
               translate([0, 0, 0])  holes(17, p, 60, 6); 
//              translate([0, 0, 0]) rotate([0,0,90])  holes(11, p, y, 6);  
//             translate([0, 0, p/2])  rc(x+11, y+11, p, p);
		}    
             for(i=[-1,1])  translate([0, i*y/2, 0])    holes(h3, p*2, x, fn);  
              translate([0, 0, 0]) rotate([0,0,90])  holes(h3, p*2, y, fn);  
               translate([0, 0, -1])  holes(y, p*2, 24, 6); 
               translate([0, 0, -1])  holes(h3+.5, p*2, 60); 
	} 
}

module darm(l, o){
      
	difference(){
		union(){ 
             holes(11, p, l, 6);
             holes(11, p, l-o*2, 6); 
              translate([0, 0, p/2])  c(l, 6, p);
		}   
            translate([0, 0, p/2]) slot(3, p, l/2-9);
           for(i=[-1,1])  translate([i*(l/2-o/2-1), 0, p/2]) slot(3, p, 7);
         
              translate([0, 0, -1])   holes(h3, p*2, l-o*2, fn);
//              translate([0, 0, p/2])   holes(7, p, l-o*2, fn);
              translate([0, 0, -1])   holes(h3+.4, p*2, l, fn);
              translate([0, 0, p/2])   holes(7, p, l, fn);
	} 
}

module parm(l, o){
      
	difference(){
		union(){ 
             holes(11, p, l, 6);
              translate([ l/2-o, 0, p/2]) rotate([0,0,90])   cy(11, p, 6);
              translate([0, 0, p/2])  c(l, 6, p);
		}   
            translate([-o/2, 0, p/2]) slot(3, p, l/2);
        
              translate([ l/2-o, 0, p]) cy(7, p, fn);
              translate([ l/2-o, 0, p/2]) cy(h3, p*2, fn);
              translate([0, 0, -1])   holes(h3, p*2, l, fn);
              translate([0, 0, p/2])   holes(7, p, l, fn);
	} 
}


module frame(){ 
    union(){
	difference(){
        union(){ 
                  translate([0, 0, z/2])    rotate([ 0 , 0, 0])  cy(40, z, 6);

        translate([0, 17.25, 12])    rotate([ 90 , 0, 0]) mnt();
        }     
          translate([ 0, 20, 12])    rotate([ 90 , 0, 0])  holes(h3+.2, z*2, 50);
                  translate([0, 0, z/2])    rotate([ 0 , 0, 0])  cy(30, z*2, 6);
        
    }
        translate([0, -25, 0])    rotate([ 0 , 0, 180]) mnt(); 
       
             translate([0, 15.25, 0])  hull(){
           
             translate([0, 0, z/2])   c(26, z, z);
             translate([0, 0, z+1])  c(40, z, 1);
        }
//          translate([ 0, 20, 12])    rotate([ 90 , 0, 0])  holes(5.1, z*2, 50);
        
//          translate([ 0, 0, -1])    rotate([ 0 , 0, 90])  holes(3.1, z*2, 20, fn);
//          translate([ 0, 0, z/2])    rotate([ 0 , 0, 90])  holes(7, z, 20, 6);
//           for(i=[-1,1])   translate([11*i, 0, z/2])    rotate([ 0 , 0, 90])  cy(22, z*2, 6);
    } 
}
 
 

module arm(l, d=4){  
    c = 6;
	difference(){
		union(){ 
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c +i+1   , d, 6);  
                translate([0,0,d/2]) rc(d+.4, l, d, 2);  
//                translate([ 0, -l/2 , d])   cy(  c  , d*2, 6);  
		} 
                translate([0,0,-d/2]) hull() rotate([0,0,90]) holes(2, d*2, l*.6, 6);
				for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(   (i==-1 ? 1.8:h2+.5) , d*4, fn);   
                    translate([ 0, l/2 , d+1])   cy(  4.5  , d, fn);  
	}
}    




 
 

  


	
	