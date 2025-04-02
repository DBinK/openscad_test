include <BOSL2/std.scad>

// Parameter Configuration
board_thickness = 5; // For example: 5mm

num_holes_x = 8; // Number of holes along the X direction
num_holes_y = 8; // Number of holes along the Y direction

hole_spacing_x = 50; // Distance between holes in the X direction
hole_spacing_y = 50; // Distance between holes in the Y direction
hole_radius = 5; // Radius of the holes

surround = 20;
corner_radius = 20;

// Colors
// board_color = [0.8, 0.8, 0.8]; // Light gray for the board
// hole_color = [1, 0, 0]; // Red for the holes

raw_length = hole_spacing_x * (num_holes_x - 1);
raw_width  = hole_spacing_y * (num_holes_y - 1);

// Main Module
module pegboard() {
    // Create the board
    difference() {
        // Create the overall board
        // color(hole_color) 
        translate([raw_length/2, raw_width/2, board_thickness/2]) {
            cuboid([raw_length + surround*2,
                raw_width + surround*2,
                board_thickness], 
                rounding = corner_radius,
                edges = "Z");
        }

        // Create the holes
        for (i = [0 : num_holes_x - 1]) {
            for (j = [0 : num_holes_y - 1]) {
                translate([i * hole_spacing_x, j * hole_spacing_y, board_thickness / 2]) {
                    cylinder(h = board_thickness + 1, r = hole_radius, center = true);
                }
            }
        }
    }
}

// Call the main module to generate the pegboard
pegboard();


