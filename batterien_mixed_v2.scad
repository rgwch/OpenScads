/**
    Aufbewahrung von 12 AA und 10 AAA Batterien
*/

include <toolbox_1.2.scad>

thick=0.9;
length=77;
width=65;
height=20;
split=length/3*2;
AA_diameter=15.1;
AAA_diameter=11.5;
block_len=26.5;
block_width=17.4;
block_rad=3;

difference(){
    roundedCube([length,width,height],5,100);
    translate([thick,thick,thick*1.5]){
    for(y=[AA_diameter/2:AA_diameter+.3:width-AA_diameter/2]){    
        for(i=[AA_diameter/2:AA_diameter+thick+.3:split-AA_diameter/2]){
            translate([i,y,0])
                cylinder(d=AA_diameter,h=height+2);
            
            
        }
    }
    translate([split-0.1,thick,thick*1.5]){
    for(y=[AAA_diameter/2:AAA_diameter+.3:width-AAA_diameter/2]){    
        for(i=[AAA_diameter/2:AAA_diameter+thick+.3:length-AAA_diameter/2]){
            translate([i,y,0])
                cylinder(d=AAA_diameter,h=height+2);
            
            
        }
    }
    }
}
}