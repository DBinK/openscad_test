$fa = 1;
$fs = 0.1;

board_width  = 60;
board_length = 90;
board_thickness = 5;

hole_radius = 2.5;

difference() {
    cube([board_length, board_width, board_thickness]);
    cylinder(h=board_thickness*4,r=hole_radius,center=true);
}