/**
    Einfaches Geäuse für Arduino Uno
*/

include <devices.scad>
thick=2.1;

constants=arduino_uno_constants();

difference(){
union(){
    roundedBox([lookup(total_length,constants),lookup(total_width,constants),10],radius=3,thick=thick);
    translate([0,0,-thick])
        arduino_uno_r3_base(thick=thick);
    }
    arduino_uno_r3_front(thick=thick);
}