/**
    Tray for the 2019 Hyunday Kona EV am rest box.
*/

breite=153;
laenge=120;
tiefe=40;
thick=2.1;
halter_l=20;
halter_w=8;
halter_d=1.2;

// Box
difference(){
    roundedCube([laenge,breite,tiefe],4);    
    translate([thick,thick,thick+1])
        roundedCube([laenge-2*thick,breite-2*thick,tiefe-thick],4);
}

// Halter
translate([halter_l,-halter_w+thick,tiefe-halter_d])
    cube([halter_l,halter_w,halter_d]);
translate([laenge-2*halter_l,-halter_w+thick,tiefe-halter_d])
    cube([halter_l,halter_w,halter_d]); 
translate([halter_l,breite-thick,tiefe-halter_d])
    cube([halter_l,halter_w,halter_d]);
translate([laenge-2*halter_l,breite-thick,tiefe-halter_d])
    cube([halter_l,halter_w,halter_d]);
    
// Teiler

translate([0,breite/3,0])
    cube([laenge,2*thick,3*tiefe/4]);

/*
    cube mit gerundeten Ecken.
    Parameter: Aussenmasse, Radius der Eckenrundungen.
*/
module roundedCube(size, radius,steps=50)
{
    x = size[0];
    y = size[1];
    z = size[2];
    linear_extrude(height=z)
        hull(){
            translate([radius, radius, 0])
            circle(r=radius,$fn=steps);

            translate([x-radius, radius, 0])
            circle(r=radius, $fn=steps);

            translate([x-radius, y-radius, 0])
            circle(r=radius,$fn=steps);

            translate([radius, y-radius, 0])
            circle(r=radius,$fn=steps);
            
        }

}