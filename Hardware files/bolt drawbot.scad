


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
  
    h2 = 2.5; 
    h3 = 3.1;
    h2i = 3.6; 
    h3i = 5.2; 

fn = 150;

//%cy(110, 1, 50);  
  
// mirror([0, 0, 1]) {
//      translate([-57.5 , 0, 0])  ! 
//fr(); 
//       
//      translate([0 , 0, p*2])   rotate([180, 0]) 
//     mid();   
//         
//  }

//         for(i=[-1, 1])   translate([10, i*30, 5])   
//      pully();  
  
       
         
//tmnt();

//!p2();
         
//         im();
         
//    mirror([1, 0, 0])      toolMount();
//         penMount();
        
//        phex();
         
//     pully();   
//   translate([0,0,12])   
   tone();
module tone(){
    difference(){
        od = 42;
        n = 32;
        a = 360/n;
               translate([ 0,0 , 1.2/2])   cy(  od    , 1.2, fn);  
    difference(){
               translate([ 0,0 , 1.2/2])   cy(  od-2    , 2, fn);  
               translate([ 0,0 , 1.2/2])   cy(  33    , 2, fn);  
             for(i=[1:n-1]) rotate([0,0,i*a])  translate([ od/2-3,0 , 1.2/2])   
                 c(  5   , (i%8==0 ? -.4:0) + 1.2, p);  
             
             for(i=[0:1]) rotate([0,0,i*a/2-a/4])  translate([ od/2-3,0 , 1.2/2])   
                 c(  5   , .8, p);  
             
             }
             for(i=[0:2]) rotate([0,0,i*120])  translate([ 14,0 , 1.2/2])   cy(h2, p, fn); 
                 translate([ 0,0 , 1.2/2])   cy(h3+.4, p, fn);
             
               translate([ 0,0 , 1.2/2])   cy(  23.4   , 2, fn);  
    }
}

  module pully(){
      pw = 33;
      pl = 11;
      
    difference(){
        union(){
      translate([0 , 0, 0])  cn(pw, pw-3, pl/2, 1.2);
      translate([0 , 0, pl]) mirror([0,0,1]) cn(pw, pw-3, pl/2, 1.2 );
        }
    difference(){
      translate([0 , 0, pl+1.2])    mirror([0,0,1]) cn(23, 20, pl, 3);
      translate([0 , 0, 2])  cn(12, 9, pl/2, 3);
//             for(i=[0:2]) rotate([0,0,i*120])  translate([ 12,0 , pl/2])   cy(8, pl, fn);  
    }
             for(i=[0:2]) rotate([0,0,i*120])  translate([ 14,0 , pl +2])   cy(h2, pl, fn);  
      translate([0 , 0, pl/2+5])  cy(5.1, pl, fn);
      translate([0 , 0, 0])  cy(3.1, pl, fn);
    
      translate([7 , 0, pl/2]) rotate([90,0]) cy(3.1, 111, fn);
      translate([0 , 0, 0])  cn(6, 3, 4, 2);
    }
  }

  module phex(){
      pw = 15;  
      pen = 9.2;
    difference(){
        union(){ 
            
                  translate([ 0, -pw/2, 1])  c(pw+2, 4, 2);  
                  translate([ 0, -pw/2, p])  cy(pw, p*2, 6);  
        }
                  translate([ 0, -pw/2, p])  cy(pen, p*4, 6);  
    }
}
  
  module penMount(){
      pw = 15; 
      hh = 26.5;
    difference(){
        union(){ 
                  translate([ 0, -pw/2, p])  cy(hh, p*2, 6);  
                translate([0 , -pw, pw-2])  rotate([90, 0, 0]) holes(12, p, 10, 6);
            hull() {
//             translate([0 , -pw, 11/2])  rotate([90, 0, 0]) holes(11, p, 18, 6);
            }
            
        }
                  translate([ 0, -pw/2, p/2])  cy(15.4, p*4, 6);  
        
                  translate([ 0, 0, p])   rotate([90, 0, 0]) cy(h3, p*4, fn);  
                  translate([ 0, 8, p]) rotate([90,0,0])   cn(6.6, 3, 6, 4);
        
            translate([ 0 , -pw+1, pw-2])  rotate([90, 0, 0]) holes(h3-.1, p*2, 10, fn);
    }
}
         

  module toolMount(){
      pw = 15; 
      hh = 24;
    difference(){
        union(){ 
                  translate([ 5, -11, p/2])  rotate([0, 0, 90])  cy(hh, p, 3); 
                  translate([ 5, 0, p/2])  rotate([0, 0, 0])  cy(11, p, 6); 
            
                  translate([ -15, -8, p/2])  rotate([0, 0, 0])  cy(18, p, 6); 
//            translate([0 , 0, 0])  rotate([0, 0, 0]) holes(11, p, 20, 6);
            hull() {
                translate([0 , -pw, 8])  rotate([90, 0, 0]) holes(11, p, 20, 6);
             translate([0 , -pw, 11/2])  rotate([90, 0, 0]) holes(11, p, 18, 6);
            }
            
        }
                  translate([ -15, -8, p/2])  rotate([0, 0, 0])  cy(h3, p*2, fn); 
                  translate([ 5, 0, p/2])  rotate([0, 0, 0])  cy(h3, p*2, fn); 
                  translate([ 5, -11, p/2])  rotate([0, 0, 90]) cy(hh-11, p*2, 3); 
//            translate([ 0 , 0, -1])  rotate([0, 0, 0]) holes(h3, p*2, 20, fn);
            translate([ 0 , -pw+1, 8])  rotate([90, 0, 0]) holes(h3-.1, p*2, 20, fn);
    }
}
         
         //idler mount
  module im(){
      pw = 50; 
      
    difference(){
        union(){
            translate([0 , 0, 0])  rotate([0, 0, 90]) holes(11, p, pw, 6);
            translate([0 , 0, 0])  rotate([0, 0, 90]) holes(11, p, pw-30, 6);
            translate([-20 , 0, 0])  rotate([0, 0, 90]) holes(11, p, 22, 6); 
            
            translate([-10 , 0, 0])  rotate([0, 0, 0]) holes(11, p, 20, 6); 
            
            translate([0 , 0, p/2])  c(5, pw, p);
            translate([-20 , 0, p/2])  c(6, 20, p);
            translate([-6 , 0, p/2])  rotate([0, 0, 180]) cy(34, p, 3);
        }   
            translate([-9 , 0, p/2])  rotate([0, 0, 180]) cy(16, p*2, 3);
            translate([0 , 0, -1])  rotate([0, 0, 90]) holes(h3, p*2, pw); 
            translate([0 , 0, -1])  rotate([0, 0, 90]) holes(h3, p*2, pw-30); 
            translate([-20 , 0, -1])  rotate([0, 0, 90]) holes(h3, p*2, 22); 
        
            translate([-10 , 0, -1])  rotate([0, 0, 0]) holes(h3, p*2, 20); 
    }
  }  
  
  module p2(){
      pw = 12;
      pl = 7;
      
    difference(){
        union(){
      translate([0 , 0, 0])  cn(pw, pw-3, pl*2, pl*2-2);
      translate([0 , 0, pl*2.5]) mirror([0,0,1]) cn(pw, pw-3, pl/2, 1.2 );
        } 
//      translate([0 , 0, pl/2+2])  cy(5.5, pl, fn);
      translate([0 , 0, pl/2])  cy(3.5, pl*2, fn);
     
      translate([0 , 0, pl*3+1])  rotate([180, 0]) cn(6, 3, pl*3, pl*3-2);
    }
  }  

  
module mid(){ 
    difference(){
        union(){ 
         
            for(i=[-1, 1])  translate([ 37*i , 0, p/2]) hb(.5);
        hull(){
            for(i=[-1, 1])  translate([0, 5*i , 0])  holes(24, 4, 60, 6);
        }
    }   
   
            translate([0,0, -2])    holes(15, p*3, 52, 6);
            for(i=[-1:1])  translate([0, 15*i , -10])  holes(3.1, 21, 74);  
    rotate([ 0 , 0, 90])  scale([.8, .8, 1]) cut();
      for(j=[-1:1])   for(i=[-1,1])  translate([j*20, 14*i , -1])    rotate([ 0 , 0, 0])   slot(3.5, p*2, 15); 
    
}
}
 

//motor frame
module fr(){
    difference(){
        union(){ 
         
             for(j=[-1, 1])   translate([0,j*31, 0])  rotate([ 0 , 0, 0])
                 mirror([0, j==1?0:1]) {
          translate([0,0, 0])  mn();
                 }
        hull(){
            for(i=[-1, 1])  translate([0, 9*i , 0])  holes(24, 4, 37, 6);
        }
    }
//    for(i=[-1, 1])  translate([i*20.5, 0, 2])   hb();
           
               translate([33, 0, -1])  rotate([ 0 , 0, 90])  holes(3.5, 11, 15);
            for(i=[-1:1])  translate([0, 11*i , -10])  holes(3.1, 21, 51);  
            for(i=[-1:1])  translate([0, 11*i , 0])  cs(3.1, 6, 2, 51);  
                
            cut();
            
      for(j=[-1,1])   for(i=[-1:1])  translate([j*18, 12*i , -1])    rotate([ 0 , 0, 90])   slot(3.3, p*2, 7); 
    }
    
}

module cut(){
    
           for(i=[0:5])   rotate([ 0 , 0, i*60]) translate([-9, 0   , -1]) cy(15, 11, 3); 
            for(j=[-1,1]) translate([0, j*15, 0]) 
                for(i=[0,1])   rotate([ 0 , 0, i*180]) translate([-9, 0   , -1]) cy(15, 11, 3); 
                    
              for( j=[0,1]) mirror([0, j, 0])  translate([0, -22.5, 0])    tri();
}

module tri(){
    intersection(){
    translate([0, 10   , p]) c(100, 20, 20);
     for(j=[0,1]) mirror([j, 0, 0]) translate([4.5, 0   , p/2]) cy(15, p*2, 3); 
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
     
            
   translate([0, 0, 0])    rotate([ 0 , 0, 90])   slot(7-v, 4, 15); 
   }

module mn(yy = 0){ 
	difference(){
        union(){
            hull(){
               translate([0, -10.5, p/2])    rc(40, 3,p, 2);
               translate([ 0, 0, p/2])    rc(38+yy, x+3, p, 2); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
            translate([ yy, 0, p])   servo();
//            translate([ -yy*3.3, -1, -1])  rotate([0,0,90])  slot(4, 9, 8);
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
                  for(i=[-1,1])  translate([ 40+i*5, 0,  p/2]) cy(11, p, 6); 
                  }    
//                  translate([ -23, 0, p/2+1])   cy(11, p+2, 6);
                  holes(11,  p+2, 46, 6);
        }    
//               translate([ -22, 0, p/2])   cy(h3, p*3, fn);
                  translate([ -23, 0, p+3]) rotate([180,0,0])   cn(6.6, 3, 6, 4);
        holes(h3, p*3, 46);
        
                    for(i=[-1,1])  translate([ 40+i*5, 0, p/2])  rotate([0,0,90])   cy(h3, w, fn); 
                    for(i=[-1,1])  translate([ 40+i*5,  0, p+3])  rotate([180,0,0])   cn(6.6, 3, 6, 4); 
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

 
 

  


	
	