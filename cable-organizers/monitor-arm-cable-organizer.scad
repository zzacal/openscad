
pin_width = 5;
pin_depth = 2;
pin_clearance_buffer = 0.4;
pin_hole_wall_thickness = 3;
pin_hole_width = pin_width - pin_clearance_buffer;
pin_hole_depth = pin_depth - pin_clearance_buffer;
pin_hole_wall_width = pin_hole_width + pin_hole_wall_thickness;
pin_hole_wall_depth = pin_hole_depth + pin_hole_wall_thickness;

// Top
// Pinhole
ceiling_width = 35;
ceiling_dep = 3;
ceiling_y_offset = ceiling_dep / 2 + pin_hole_wall_depth/2 + 1;

top_pinhole_y_offset = pin_hole_wall_depth + 1;

extrude_height = 12;

linear_extrude(height = extrude_height)  {
    translate([0, top_pinhole_y_offset]){
        difference() {
            union() {
                // ceiling
                translate([0, ((pin_hole_depth - ceiling_dep)/2) - .1 ]) {
                    square([ceiling_width, ceiling_dep], center=true);
                }
                // ceiling pinhole
                square([pin_hole_wall_width, pin_hole_wall_depth], center=true);
            }
            square([pin_hole_width, pin_hole_depth], center = true);
        }
    }

    // Bottom
    // Pinhole
    difference() {
        square([pin_hole_wall_width, pin_hole_wall_depth], center=true);
        square([pin_hole_width, pin_hole_depth], center = true);
    }

    // Stem
    stem_width = 3;
    stem_depth =  1;
    stem_y_offset= -stem_depth/2 - pin_hole_wall_depth/2;
    translate([0, stem_y_offset]) {
        square([stem_width, stem_depth], center=true);
    } 

    // Floor
    floor_width = ceiling_width + 10;
    floor_depth = 3;
    floor_y_offset = -floor_depth/2 - pin_hole_wall_depth/2 - stem_depth;
    floor_wing_width = 2;
    floor_wing_depth = 5;

    translate([0, floor_y_offset]) {
        square([floor_width, floor_depth], center=true);
        translate([floor_width/2 - floor_wing_width, floor_depth/2]) {
            square([floor_wing_width, floor_wing_depth]);
        }
        translate([-floor_width/2, floor_depth/2]) {
            square([floor_wing_width, floor_wing_depth]);
        }
    }
}

ceiling_floor_arm_space = 2;
arm_thickness = 2;
pin_arm_space = ceiling_floor_arm_space + pin_depth * 2;
pin_arm_width = extrude_height/2;
pin_arm_depth = pin_depth * 2 + pin_arm_space;
pin_arm_y_offset = pin_arm_depth/2 + pin_hole_wall_depth/2 + pin_hole_wall_depth + 2;
translate([pin_arm_width, pin_arm_y_offset]) {
    linear_extrude(height = pin_width) 
    difference() {
        square([pin_arm_width, pin_arm_depth], center = true);
        translate([arm_thickness/2, 0]) { 
            square([pin_arm_width - arm_thickness, pin_arm_space],center = true);
        }
    }
}

translate([-pin_arm_width, pin_arm_y_offset]) {
    linear_extrude(height = pin_width) 
    difference() {
        square([pin_arm_width, pin_arm_depth], center = true);
        translate([arm_thickness/2, 0]) { 
            square([pin_arm_width - arm_thickness, pin_arm_space],center = true);
        }
    }
}
