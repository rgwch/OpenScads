/**
    Ablagefläche für ein Huawei P20 Pro über dem Handy-Fach des Hyundai Kona EV.
*/

include <toolbox_1.1.scad>

outer=76.5;
inner=72;
length=100;
height=11;
thick=2.4;
mount=4+2*thick;
hole_y=35;
hole_d=15;

outer_size=[outer+2*thick,length+2*thick,height+4*thick];
inner_size=[outer,length+10,height];

union(){
    difference(){
        roundedCube(outer_size,5);
        translate([thick,thick,5*thick])
            roundedCube(inner_size,4);
        
        offset=(outer-inner);
        
        translate([thick+center(outer,15),-2,thick+10]) // Anschluss
            cube([15,10,height-2]);
        
        translate([-5,length-14.5,-1])
            cube([outer+15,11.5,height+1]);             // Nut
        
        translate([10,10,-12])
            roundedCube([inner-10,length-35,25],5);     // Loch
        
        translate([inner,length-20,height+thick])
            cube([10,25,9]);
   
    }
}
   