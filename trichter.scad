/**
    Simpler Universal-Trichter
*/

// Durchmesser oben
topwidth=45;
// Durchmesser unten
bottomwidth=12;

height=topwidth*2/3;
thick=0.9;
$fn=200;

union(){
    difference(){
        cylinder(h=height,d1=topwidth,d2=bottomwidth);
        cylinder(h=height,d1=topwidth-thick,d2=bottomwidth-thick);
    }
    translate([0,0,height]){
        difference(){
            cylinder(h=4*height/5,d1=bottomwidth,d2=bottomwidth*3/4);
            cylinder(h=4*height/5,d1=bottomwidth-thick,d2=bottomwidth*3/4-thick);
        }
    }
}