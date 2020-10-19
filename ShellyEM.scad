include <toolbox_1.1.scad>

length=40;
width=35.5;
height=17.20;
subw=27.2;
subl=22.2;
bottom=4.6;
thick=1.2;

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
                translate([length/4,width/4,-2*thick])
                    cube([length/2,width/2,4*thick]);
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
    translate([-fixation_l,0,-thick])
        fixation(0);
    translate([-fixation_l,width-fixation_w-thick,-thick])
        fixation(0);
    translate([length+fixation_l,width-thick,-thick])
        fixation(180);
    translate([length+fixation_l,fixation_w,-thick])
        fixation(180);
    
}

module fixation(y){
    rotate([0,0,y]){
        difference(){
            roundedCube([fixation_l,fixation_w,3*thick],radius=2);
            translate([fixation_w/2,fixation_w/2,-thick])
                cylinder(height+5,screw_size);
        }
    }
}