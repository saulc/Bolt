


use <myshapes.scad>
 use <servo mount.scad>
 
 /*
		 9g servo mount . m2 inserts
 */
  
z = 5;

c = 8;
oc = 15;

n = 6;
x = 21;
xx = 13.5;
  
    h2 = 2.2; 
    h3 = 3.2;
     

fn = 150;

//%cy(110, 1, 50);  
  
// !arm(24); 
 
 
 ring();

module loop(d){
    
	difference(){
            translate([0,0,z/4]) cy(d, z/2, 6);
            translate([0,0,z/2]) cy(d-z, z*2, 6);
    }
}

module ring(){   
	difference(){
		union(){
            loop(46);
            translate([0,0,z/2]) cy(oc+z, z, 6);
                
            for(i=[1:n]) rotate([0,0,i*360/n]){
                for(i=[0:1]) translate([xx*i, 0, 0]) {
                translate([x,0,z/4]) cy(c*2, z/2, 6);
                translate([x,0,z/2]) cy(c, z, fn);
                }
                if(i%2==0)
                 translate([x,0,z/4]) c(x*1.3, z, z/2);
            }
        }
            translate([0,0,z]) cy(oc, z, 6);
         
                translate([0,0,z/4]) cy(h3+.4, z, fn);
        
               
            for(i=[1:n]) rotate([0,0,i*360/n])
                for(i=[0:1]) translate([xx*i, 0, 0])  translate([x,0,1]) cy(h3, z*3, fn);
    }
}




 
 

  


	
	