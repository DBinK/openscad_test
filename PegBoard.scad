include <BOSL2/std.scad>


/*[ 板子参数 ]*/
board_thickness = 3;   // 板厚 
board_surround  = 10;  // 板环绕最外围的孔的距离
board_radius    = 5;   // 板子圆角半径


/*[ 孔洞数量 ]*/
num_holes_x = 8;       // X方向的孔数
num_holes_y = 6;       // Y方向的孔数

/*[ 孔洞参数 ]*/
hole_spacing_x = 20;   // X方向孔之间的距离
hole_spacing_y = 20;   // Y方向孔之间的距离
hole_radius    = 3.2;  // 孔的半径


// 颜色
// board_color = [0.8, 0.8, 0.8]; // 板子为浅灰色
// hole_color = [1, 0, 0];        // 孔为红色

raw_length = hole_spacing_x * (num_holes_x - 1);
raw_width  = hole_spacing_y * (num_holes_y - 1);

// 主模块
module pegboard() {
    // 创建板子
    difference() {
        // 创建整体板子
        // color(hole_color) 
        translate([raw_length/2, raw_width/2, board_thickness/2]) {
            cuboid([raw_length + board_surround*2,
                raw_width + board_surround*2,
                board_thickness], 
                rounding = board_radius,
                edges = "Z");
        }

        // 创建孔
        for (i = [0 : num_holes_x - 1]) {
            for (j = [0 : num_holes_y - 1]) {
                translate([i * hole_spacing_x, j * hole_spacing_y, board_thickness / 2]) {
                    cylinder(h = board_thickness + 1, r = hole_radius, center = true);
                }
            }
        }
    }
}

// 调用主模块生成钉板
pegboard();