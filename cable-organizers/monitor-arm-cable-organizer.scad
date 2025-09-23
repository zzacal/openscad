
pin_width = 5;
pin_depth = 3;
pin_clearance_buffer = 0.4;
pin_hole_wall_thickness = 3;
pin_hole_width = pin_width + pin_clearance_buffer;
pin_hole_depth = pin_depth + pin_clearance_buffer;
pin_hole_wall_width = pin_hole_width + pin_hole_wall_thickness;
pin_hole_wall_depth = pin_hole_depth + pin_hole_wall_thickness;

band_space = 1.2;
band_wall_thickness = 2;

ceiling_width = 35;
ceiling_dep = 3;
ceiling_y_offset = ceiling_dep / 2 + pin_hole_wall_depth/2 + band_space;

top_pinhole_y_offset = pin_hole_wall_depth + band_space;

extrude_height = 17;

// Top
// Pinhole

linear_extrude(height = extrude_height)  {
    translate([0, top_pinhole_y_offset]){
        difference() {
            union() {
                // ceiling
                translate([0, (-(pin_hole_wall_depth - ceiling_dep)/2) ]) {
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
    stem_width = pin_hole_wall_width;
    stem_depth =  5;
    stem_y_offset= -stem_depth/2 - pin_hole_wall_depth/2;
    translate([0, stem_y_offset]) {
        square([stem_width, stem_depth], center=true);
    } 

    // Floor
    floor_width = ceiling_width + 20;
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

// Band_space
band_space_offset = band_space/2 + pin_hole_wall_depth/2;
linear_extrude(band_wall_thickness) {
    translate([0, band_space_offset, 0]) {
        square([pin_hole_wall_width, band_space], center=true);
    }
}

translate([0, band_space_offset, extrude_height - band_wall_thickness]) {
    linear_extrude(height = band_wall_thickness) {
        square([pin_hole_wall_width, band_space], center=true);
    }
}

ceiling_floor_arm_space = 0.2;
arm_thickness = 2;
pin_arm_latch_width = 1;
pin_arm_latch_depth = 1.6;
pin_arm_space = ceiling_floor_arm_space + pin_depth * 2 + pin_arm_latch_depth - 1.4;
pin_arm_width = extrude_height + arm_thickness + pin_arm_latch_width;
pin_arm_depth = pin_depth * 2 + pin_arm_space - pin_arm_latch_depth;
pin_arm_y_offset = pin_arm_depth/2 + pin_hole_wall_depth/2 + pin_hole_wall_depth + 2;
pin_arm_x_offset = 0;
//pin_arm_y_offset = 3.8;
// pin_arm_x_offset = -pin_arm_width/2;

#linear_extrude(height = pin_width) {
    translate([pin_arm_x_offset, pin_arm_y_offset]) {
        difference() {
            union() {
                square([pin_arm_width, pin_arm_depth], center = true);
                translate([pin_arm_width/2 - pin_arm_latch_width/2, pin_arm_depth/2]) {
                    square([pin_arm_latch_width, pin_arm_latch_depth], center=true);
                }
                translate([pin_arm_width/2 - pin_arm_latch_width/2, -pin_arm_depth/2]) {
                    square([pin_arm_latch_width, pin_arm_latch_depth], center=true);
                }
            }
            translate([arm_thickness/2, 0]) { 
                square([pin_arm_width - arm_thickness, pin_arm_space],center = true);
            }
        }
    }
} 

