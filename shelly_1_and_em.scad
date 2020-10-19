/**
 A case for a ShellyEM and a Shelly1 side by side
*/

include <toolbox_1.2.scad>


thick=2.1;
length=86+thick;
width=70;
height=25;
$fn=100;
offset=10;
fix_l=9;
fix_w=8;

shellybox();
shellycover();
// shelly_1();
// shelly_EM();

module shellybox(){
    union(){
        difference(){
            union(){
                difference(){
                    roundedBox([length+offset,width,height],5,thick);
                    // Steuerkabel
                    translate([length+5,width-18,height+2])
                        rotate([0,90,0])
                            roundedCube([10,14,20],4);
                    
                  // Stromkabel
                    translate([-5,width-16,height+2])
                        rotate([0,90,0])
                            roundedCube([12,12,20],4);                
                  }
                // Halterung für Shelly-1
                translate([21+thick+offset,21+thick,-thick])
                    shelly_1();
                // Halterung für Shelly-EM
                translate([45+thick+offset,0.3,0])
                    shelly_EM();
              
                // Schraub-Befestigungen
                translate([-fix_l,thick,-thick])
                    fixation(l=fix_l,w=fix_w,screw=4,thick=1.2);
                translate([length+offset+fix_l,fix_w+thick,-thick])
                    fixation(l=fix_l, w=fix_w,screw=4, thick=1.2,y=180);
                translate([-fix_l,width-thick-fix_w,-thick])
                    fixation(l=fix_l,w=fix_w,screw=4,thick=1.2);
                 translate([length+offset+fix_l,width-fix_w+2*thick,-thick])
                    fixation(l=fix_l, w=fix_w,screw=4, thick=1.2,y=180);
              
                
            }
            // Ausdrücköffnungen
            translate([length+offset-20,17,-thick-2])
               cylinder(d=25, h=10);
               
             translate([offset+23,23,-thick-2])
                  cylinder(d=25, h=10);
            
            // Lüftungsschlitze
            for(i=[10:7:length+offset-25]) 
                slot(i,width-38,[-2,35,-2.5]);
                  
            }
              
    }
}
module shellycover(){
    translate([0,-width-7,0]){
        difference(){
            roundedCover([length+offset,width,10],5,thick,4.5,4.5);
            for(i=[8:7:length+offset-30]) 
                slot(i,width-10,[0,5,1]);
            }
    }
}

module handle(outerSize){
    innerSize=outerSize-[thick,2*thick,-2*thick];
    difference(){
        cube(outerSize);
        translate([0,thick,-thick])
           cube(innerSize);
    }
}

module shelly_1(){
   
        cylinder(d=42.5+2*thick,h=thick);
        difference(){
            translate([0,0,0])
                tube(42.5,height/2,thick);
            translate([-22,11,0])
                cube([44,18,height]);
        }
   
      
}

module shelly_EM(thick=1.2){

length=40;
width=35.5;
height=12; // 17.20;
subw=27.2;
subl=22.2;
bottom=4.6;
// thick=1.2;

dw=width-subw;
dl=(length-subl)/2;

screw_size=3;
fixation_w=1.5*screw_size+2*thick;
fixation_l=fixation_w+screw_size;

union(){
    difference(){
        union(){
            difference(){
                box([length,width,height],thick);
                translate([thick,4*thick,bottom+thick])
                    cube([length-2*thick,width-thick,height]);
                translate([length/6,width/6,-2*thick])
                    cube([length/1.4,width/1.4,4*thick]);
            }
            rotate([0,0,45]){
                translate([-dl/2,-dw/2,thick]){
                   box([dl,dw,height-thick],1);
                }
            }
            translate([length,0,0]){
                rotate([0,0,45]){
                    translate([-dl/2,-dw/2,thick]){
                       box([dl,dw,height-thick],1);
                    }
                }
            }
        }
        translate([-10-thick,-10,-thick])
            cube([10,width+10,height+5]);
        translate([length+thick,-10,-thick])
            cube([10,width+10,height+5]);
        translate([-thick,-10-thick,-thick])
            cube([length+10,10,height+5]);
          
    }
}
}