source_size = 180;
target_size = 140;
x_offset = 0;
y_offset = 0;
h_offset = 50;
wall_thickness = 1;
deck_thickness = 2;

$fn = 200;

screw_hole_diameter = 4;
screw_hole_corner_offset = 7.5;

source_diameter = source_size;
target_plate_inner_radius = 80;
target_plate_width = target_size - target_plate_inner_radius;
target_plate_depth = target_size - target_plate_inner_radius;

target_plate_outer_radius = 25;
target_width = target_size;
target_depth = target_size;

source_plate_outer_radius = 25;

// source plate
linear_extrude(height = deck_thickness) {
    difference() {
        minkowski() {
            square([source_size - source_plate_outer_radius, source_size - source_plate_outer_radius], center = true);
            circle(d = source_plate_outer_radius);
        }
        circle(d = source_diameter - wall_thickness*2);

        translate(v = [source_diameter/2 - screw_hole_corner_offset, source_diameter/2 - screw_hole_corner_offset, 0]) {
            circle(d = screw_hole_diameter);
        }
        translate(v = [-source_diameter/2 + screw_hole_corner_offset, source_diameter/2 - screw_hole_corner_offset, 0]) {
            circle(d = screw_hole_diameter);
        }
        translate(v = [-source_diameter/2 + screw_hole_corner_offset, -source_diameter/2 + screw_hole_corner_offset, 0]) {
            circle(d = screw_hole_diameter);
        }
        translate(v = [source_diameter/2 - screw_hole_corner_offset, -source_diameter/2 + screw_hole_corner_offset, 0]) {
            circle(d = screw_hole_diameter);
        }
    }
}

difference() {
    union() {
        hull() {
            // source
            linear_extrude(height = deck_thickness) {
                circle(d = source_diameter);
            }

            // target
            translate([x_offset, y_offset, h_offset]) {
                linear_extrude(height = deck_thickness) {
                    minkowski() {
                        square([target_width - target_plate_outer_radius, target_depth - target_plate_outer_radius], center = true);
                        circle(d = target_plate_outer_radius); 
                    }
                }
            }
        }
    }

    hull() {
        // source hole
        source_diameter = source_size;
        linear_extrude(height = deck_thickness) 
        circle(d = source_diameter - wall_thickness*2);

        // target hole
        target_width = target_size;
        target_depth = target_size;
        translate([x_offset, y_offset, h_offset]) {
            linear_extrude(height = deck_thickness) {
                minkowski() {
                    square([target_width - target_plate_outer_radius - wall_thickness*2, target_depth - target_plate_outer_radius - wall_thickness*2], center = true);
                    circle(d = target_plate_outer_radius);
                }
            }
        }
    }
}

// target plate
translate(v = [x_offset, y_offset, h_offset]) {
    linear_extrude(height = deck_thickness) {
        difference() {
            minkowski() {
                square([target_width - target_plate_outer_radius, target_depth - target_plate_outer_radius], center = true);
                circle(d = target_plate_outer_radius); 
            }
            minkowski() {
                square([target_plate_width, target_plate_depth], center = true);
                circle(d = target_plate_inner_radius);
            }
            translate(v = [target_width/2 - screw_hole_corner_offset, target_depth/2 - screw_hole_corner_offset]) {
                circle(d = screw_hole_diameter);
            }
            translate(v = [target_width/2 - screw_hole_corner_offset, -target_depth/2 + screw_hole_corner_offset]) {
                circle(d = screw_hole_diameter);
            }
            translate(v = [-target_width/2 + screw_hole_corner_offset, target_depth/2 - screw_hole_corner_offset]) {
                circle(d = screw_hole_diameter);
            }
            translate(v = [-target_width/2 + screw_hole_corner_offset, -target_depth/2 + screw_hole_corner_offset]) {
                circle(d = screw_hole_diameter);
            }
        }
    }
}
