


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
    ry = 9;
    
    wd = 102;
    ww = 6;
    wh = 11;

//%cy(110, 1, 50);  
  
// mirror([0, 0, 1]) {

      translate([0 , 0, 44])   rotate([180, 0, 90])  
mid();
      translate([0 , 0, 0])  
fr(); 
       
    % 
      translate([0 , 0, 10])   rotate([90, 0, 90])   servo();
  
//  }
       for(i=[-1,1])  translate([0,i*50,15]) rotate([-90*i, 0]) {
       wheel();
//         shex();    
            
    rotate([180, 0])  sv();
       }
  
  module wheel(){
          difference(){
        union(){
      translate([0 , 0, wh/2])  cy(wd, wh, fn); 
        }
          difference(){
      translate([0 , 0, wh/2])  cy(wd-p, wh+2, fn);
          difference(){
      translate([0 , 0, wh/4+.5])  rotate([0,0,90]) cy(18, wh/2, fn);
      translate([0 , 0, wh-2])  rotate([0,0,90]) cy(18-3, wh, fn);
          }
              
      translate([0 , 0, wh/4-1])  rotate([0,0,90]) cy(24, wh/2, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, ww/2])  cy(11, ww, fn);
                 for(i=[0:5]) rotate([0,0,i*60]) {
                     
              translate([wd/4+9 , 0, ww/2])  c(wd/2, 1.2, ww); 
              hull(){
              translate([9 , 0, 0])  cy(7, p, 6); 
              translate([wd/2 , 0, 0])  cy(3, p, 6); 
              }
          }
//          for(i=[0:2]) rotate([0,0,i*120]) 
//              translate([9 , 0, ww/2])  cy(12, ww, 6); 
          
          }
      translate([0 , 0, ww/2])  rotate([0,0,90])cy(8, ww*2, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, 0])  cy(h3, ww*2, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, ww])  cy(8, ww, fn);
    }
  }
  
  
  module sv(){
      hx = 8.5;
    difference(){
        union(){
      translate([0 , 0, 1])  cy(24, 2, fn);
      translate([0 , 0, hx/2])  cy(8.8, hx, 6);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, p/2])  cy(6, p, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([5 , 0, p/2])  c(12, 1.2, p);
        }
      translate([0 , 0, hx/2+2])  cy(5.1, hx, fn);
      translate([0 , 0, 0])  cy(3.1, hx, fn);
//      translate([0 , 0, -.1])  cn(5.1, 3, 2, .2);
        
        
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, 0])  cy(2.2, hx*3, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, hx/2+2])  cy(4, hx, fn);
    }
  }
  
  module fhex(){
      hx = 3.5;
    difference(){
        union(){
//      translate([0 , 0, 1])  cy(24, 2, fn);
      translate([0 , 0, hx/2])  cy(8.7, hx, 6); 
        } 
      translate([0 , 0, 0])  cy(3.5, hx*3, fn); 
//      translate([0 , 0, hx/2-2])  cn(5.1, 3, 5, 2); 
        
         
    }
  }
  
  module shex(){
      hx = 12.5;
    difference(){
        union(){
      translate([0 , 0, 1])  cy(24, 2, fn);
      translate([0 , 0, hx/2])  cy(8.7, hx, 6);
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, p/2])  cy(6, p, fn);
          for(i=[0:2]) rotate([0,0,i*120]) translate([5 , 0, p/2])  c(12, 1.2, p);
        }
      translate([0 , 0, 0])  cy(5.1, hx, fn);
      translate([0 , 0, 0])  cy(3.1, hx*3, fn);
      translate([0 , 0, hx/2-2])  cn(5.1, 3, 5, 2);
        
        
          for(i=[0:2]) rotate([0,0,i*120]) translate([9 , 0, 0])  cy(2.2, hx*3, fn);
    }
  }
  
module mid(){ 
    difference(){
        union(){ 
         
            for(i=[-1, 1])  translate([ 37*i , 0, p/2]) hb(.5);
        hull(){
            for(i=[-1, 1])  translate([0, 11*i , 0])  holes(24, 4, 60, 6);
        }
    }   
   
//            translate([0,0, -2])    holes(15, p*3, 52, 6);
            for(i=[-1:1])  translate([0, 15*i , -10])  holes(3.1, 21, 74);  
            for(i=[-1,1])  translate([0, 15*i , -.1])  cs( 3.1, 6,  2.1, 74);  
                
    rotate([ 0 , 0, 90])  scale([1.3, 1.3, 1]) cut();
      for(j=[-1:1])   for(i=[-1,1])  translate([j*20, 20*i , -1])    rotate([ 0 , 0, 0])   slot(3.5, p*2, 15); 
    
}
}
 

//motor frame
module fr(){
             for(j=[-1, 1])   translate([0,j*46, 12])  rotate([ 90 , 0, 0])
                 mirror([0, 0, j==1?0:1]) {
          translate([0,0, 6])  mn();
                 }
    difference(){
        union(){ 
         
        hull(){
            for(i=[-1, 1])  translate([0, 24*i , 0])  holes(24, 4, 29, 6);
        }
    }
    for(i=[-1, 1])  translate([i*20.5, 0, 2])   hb();
           
               translate([33, 0, -1])  rotate([ 0 , 0, 90])  holes(3.5, 11, 15);
            for(i=[-1:1])  translate([0, 15*i , -10])  holes(3.1, 21, 41);  
                
            cut();
            
      for(j=[-1,1])   for(i=[-1,1])  translate([j*16, 18*i , -1])    rotate([ 0 , 0, 90])   slot(3, p*2, 9); 
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
               translate([0, -10.5 , p/2])    rc(29, 3,p, 2);
              translate([ 0, 21, p/2])    rc(24, x+3, p, 2); 
                  } 
        }    
                    for(i=[-1,1])  translate([ i*25, 0, c/2])  cy(h3, w, fn); 
       #     translate([ yy, 10, p])   rotate([0,0,90])  servo();
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

 
 

  


	
	