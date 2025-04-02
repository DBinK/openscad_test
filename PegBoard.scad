// Parameters for pegboard
board_length = 200;  // Length of the board
board_width = 100;   // Width of the board
board_thickness = 5; // Thickness of the board
holes_x_count = 5;   // Number of holes in the x direction
holes_y_count = 3;   // Number of holes in the y direction
hole_radius = 5;     // Radius of the holes

// Module to create pegboard
module pegboard() {
    difference() {
        // Create the rectangular board
        cube([board_length, board_width, board_thickness]);
        
        // Calculate hole spacing
        hole_spacing_x = board_length / (holes_x_count);
        hole_spacing_y = board_width / (holes_y_count);
        
        // Create holes
        for (i = [0 : holes_x_count]) {
            for (j = [0 : holes_y_count]) {
                translate([hole_spacing_x * (i), hole_spacing_y * (j), board_thickness / 2])
                    cylinder(r = hole_radius, h = board_thickness + 1, center = true); // Make holes go through the board
            }
        }
    }
}

// Call the module to generate the pegboard
pegboard();