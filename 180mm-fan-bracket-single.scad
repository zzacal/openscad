// in MM
window_width = 145;

bracket_overflow = 10;
bracket_width = (window_width + (2*bracket_overflow));
bracket_depth = 10;
bracket_height = 20;


arm_width = 10;
arm_depth = 15;
arm_height = 3;
arm_pit = 8;
arm2_x_offset = (window_width + bracket_overflow - arm_width);

finger_depth = arm_depth - arm_pit;
finger_height = bracket_height - arm_height;
finger_y_offset = bracket_depth + arm_pit;


// bracket
cube([bracket_width,
    bracket_depth,
    bracket_height]);
    

// arm 1
translate([bracket_overflow, bracket_depth, 0]) cube([arm_width, arm_depth, arm_height]);

// finger 1
translate([bracket_overflow, finger_y_offset, arm_height]) cube([arm_width, finger_depth, finger_height]);

// arm 2
translate([arm2_x_offset, bracket_depth, 0]) cube([arm_width, arm_depth, arm_height]);