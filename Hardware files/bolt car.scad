


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

//%cy(110, 1, 50);  
  
// mirror([0, 0, 1]) {
      translate([-57.5 , 0, 0])  
fr(); 
       
      translate([0 , 0, p*2])   rotate([180, 0]) 
     mid();   
        
      translate([49.5 , 0, 0])     
      sr();
//  }
      
//  shex();
//  sv();

//rbodymnt();
  
        for(i=[-1,1])       translate([55.5,i* 15 , p])   mirror([0, i<0 ? 1:0]) rotate([ 0 , 0, 90]) {
//  !        for(i=[0,1])   translate([0,i*40 , 0])    mirror([0, i])
      rlower();
//  
             translate([29, ry , 25])   rotate([ 180 , 0, 0]) 
          rlc();
  
             translate([51.5 , ry , 12.6])   rotate([ 90 , 0, -90]) 
             fhub();
//             fhex();
        }
             
            translate([63.5 , 0, p*5])      darm(91);
             
     
        

module darm(l, d=4){  
	difference(){
		union(){ 
                for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  c+2    , d, 6);  
                for(i=[-1,1])  translate([ 0, i*10 , d/2])   cy(  c+2    , d, 6);  
                translate([0,0,d/2]) rc(5, l, d, 2);  
		} 
				for(i=[-1,1])  translate([ 0, i*l/2 , d/2])   cy(  h3 +.4, d*2, fn);   //   
				for(i=[-1,1])  translate([ 0, i*10 , d/2])   cy(  h3 +.4, d*2, fn);   //   
				for(i=[-1,1])  translate([ 0, i*10 , d+1.2])  mirror([0,0,1]) cn(  6,h3 ,  4, 2);   //   
				for(i=[-1,1])  translate([ 0, i*l/2 , d+1.2])  mirror([0,0,1]) cn(  6,h3 ,  4, 2);   //   
	}
}    
 

        
module rlc(){ 
    rl = 22.5;
    rd = 15;
    difference(){
        union(){ 
          
             translate([0, 0 , rl/2]) rotate([ 0 , 0, 90])  cy(6.4, rl, 6);
             translate([rd/2, 0 , p/2])  rc( rd-2, 6, p, 3);
        
             translate([rd-4, 0 , p/2]) rotate([ 0 , 0, 90])  cy(9, p, 6);
    }    
//             translate([rd-4, 0 , p])   rotate([ 0 , 0, 90])  cy(4.5, p, fn);
    #         translate([rd-4, 0 , p/2])   rotate([ 0 , 0, 90])  cy(h3 , p*21, fn);
             translate([0, 0 , p/2])   rotate([ 0 , 0, 90])  cy(h3 , p*21, fn);
    
		      translate([ rd-4, 0,  -3 ]) rotate([0, 0,0])  cn(6, 3, 6, 6-2);  
    
}
}

module rlower(){ 
    rl = 40;
    difference(){
        union(){ 
         
//            for(i=[-1, 1])  translate([ 37*i , 0, p/2])   rotate([ 0 , 0, 90])   slot(3.5, p, 10); 
        hull(){
             translate([0, 0 , 0])   rotate([ 0 , 0, 90])  holes(9, p, 11, 6);
             translate([rl, ry , p/2])   rotate([ 0 , 0, 90])  cy(9, p, 6);
        }
    }       
    difference(){
    hull(){
             translate([7, 1 , 0])   rotate([ 0 , 0, 90])  holes(7, p*2, 7, 6);
             translate([rl/2, ry/2 , p/2])   rotate([ 0 , 0, 90])  cy(11, p*2, 6);
        }  
        translate([rl/4, ry/2 , p/2])   rotate([ 0 , 0, -60])  c(29, 1.2, 6);
        translate([rl/2, 4 , p/2])   rotate([ 0 , 0, 60])  c(39, 1.2, 6);
    }
//           for(i=[0:2] ) translate([i*(9-i/2)+5, i*2 , p/2])   rotate([ 0 , 0, 90])  cy(9-i, p*2, 6);
    
//             translate([rl, ry , p])   rotate([ 0 , 0, 90])  cy(4.5, p, fn);
		      translate([ rl, ry,  -3.5 ]) rotate([0, 0,0])  cn(6, 3, 6, 6-2);  
    
             translate([rl-11, ry , p])   rotate([ 0 , 0, 90])  cy(6.6, p, 6);
           
            translate([rl-11/2,ry, -2])    rotate([ 0 , 0, 0])   holes(h3-.2, p*3, 11);   
           
            translate([0,0, -2])    rotate([ 0 , 0, 90])   holes(h3, p*3, 25/2);   
            translate([0,0, 4.1])    rotate([ 0 ,180, 90])   cs(  h3, 6,  2, 25/2);   
    
        translate([0, 16 , p/2])   rotate([ 0 , 0, 0])  c(11, 12.4, p*2);
}
}

//!fhub();
module fhub(){
    y = 15;
    x = 11;
	w = 3;
    c = 7;
    f = 15;
    pv = 21;
    
	difference(){
		union(){ 
			hull(){
		      translate([ 0, 0,  y/2+2]) c(4, f+2, 1);
		      translate([ 0, 0,  y/2-1]) c(2, f-6, w);
			}
		      translate([ f, 0,  pv ]) rotate([90, 0,0])  cy(  c, 7, fn);   //   
			 hull(){
				 
//		      translate([ f, 0,  pv ]) rotate([90, 0,0])  cy(  c, c/2, fn);   //   
//		      translate([ y/2+2, 0,  y-c/2 ]) rotate([0, 90,0])  cy(  c, w, fn);   //   
		      translate([ x+5, 0,  pv-3 ]) rotate([90, 0,0])  cy(  1, c, fn);   //
		      translate([ x+5, 0,  pv ]) rotate([90, 0,0])  cy(  4, c, fn);   //
		      translate([ c-2, 0,  y*.6 ]) rotate([0, 90,0])  cy(  4, 1, fn);   //   
			 }
			 
		      translate([ 0, 0,  y-c/2 ]) rotate([90, 0,0])  cy(  c, f+2, 6);   //    
			 hull(){
		      translate([ 0, 0,  y*.75])  cy(  x, y/2, fn);   //button  
		      translate([ 0, 0,  1])  cy(  x-w, 2, fn);   //button  
			 } 
		}
		    for(i=[-1,1])  translate([ 0, i*(y-2),  y-c/2 ]) rotate([90, 0,0])  cy(  h3, y, fn);   //   
		
		      translate([ 0, 0,  y])  cy(  c+1, y+1, fn);   //   
		      translate([ 0, 0,  y/2])  cy(  h3, y+1, fn);   //   
		      translate([ f, 0,  pv]) rotate([90, 0,0])  cy(  h3, f, fn);   //   
			   
		      translate([ 0, 0,  9.6 ]) rotate([180, 0,0])  cn(6, 3, 6, 6-2);  
		  
	}
}


  module rbodymnt(){
       rh = 17;
      ry = 6;
      rl = 50;
    difference(){
        union(){
//      translate([0 , 0, 1])  cy(24, 2, fn);
      translate([2 , 0, p/2])  c(6, rl, p); 
//            hb();
   translate([ry, 0, 0])    rotate([ 0 , 0, 90])   slot(7-.5, rh, 15); 
      translate([0 , 0, 0])  rotate([0,0,90]) holes(11 ,p  , rl, 6);
        } 
      translate([0 , 0, 0])  rotate([0,0,90]) holes(3.5 ,p  , rl);
      translate([0 , 0, p/2])  rotate([0,0,90]) holes(6 ,p  , rl);
    
        translate([ry , 0, rh/2])  cy(3.1,rh+2, fn);
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

//steering rack
module sr(){
            translate([-4,0, 19])    rotate([ 90 , 0, -90]) mn();
                 
    difference(){
        union(){ 
         
        hull(){ 
         
 for(i=[-1,1])   translate([-6*i, 0, 0]) rotate([0,0,90]) holes(34, 4, 11, 6);
        }
    }
 for(i=[-1,1])    translate([-25/2*i, 0, 2])   hb( i==1? -.5: 0);
           
               translate([0, 0, -1])  rotate([ 0 , 0, 90])  holes(h3, 11, 30);
        cy(h3, 11, fn);
            for(i=[-1:1])  translate([0, 15*i , -10])  holes(h3, 21, 25);  
                
//            cut();
    }
    
}

//motor frame
module fr(){
             for(j=[-1, 1])   translate([0,j*36, 12])  rotate([ 90 , 0, 0])
                 mirror([0, 0, j==1?0:1]) {
          translate([0,0, 6])  mn();
                 }
    difference(){
        union(){ 
         
        hull(){
            for(i=[-1, 1])  translate([0, 18*i , 0])  holes(24, 4, 29, 6);
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
               translate([0, -10.5-4, p/2])    rc(40, 3,p, 2);
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

 
 

  


	
	