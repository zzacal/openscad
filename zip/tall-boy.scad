
total_height =15;
radius = 4;
teeth_slope = 1.2;
tooth_height = 1;
facet_number = 100;


radius_wide = radius;
radius_narrow = radius_wide/teeth_slope;
iterations = (total_height - tooth_height)/tooth_height;

cube_width = radius_wide * 2;
cube_depth = radius_wide / 2;
cube_height = total_height - (tooth_height - 1);
cube_z_offset = (cube_height / 2) + tooth_height;

difference() {
    for (i=[0:iterations]) {
        translate([0,0,i*tooth_height]){
            cylinder(h = tooth_height, r1 = radius_wide, r2 = radius_narrow, $fn = facet_number);
        }
    }
    translate([0, 0, cube_z_offset]) {cube([cube_width, cube_depth, cube_height], center = true);}
}

nut_segment_height = tooth_height;
nut_x_offset = (radius * 2) + radius;
nut_radius_wide = radius_wide*teeth_slope;

nut_tooth_width = cube_width - 1;
nut_tooth_height = nut_segment_height;
nut_tooth_offset = nut_tooth_height / 2;

nut_ledge = nut_segment_height / 2;

nut_wing_height = nut_ledge + nut_tooth_height;
nut_wing_z_offset = nut_wing_height * .5;

translate([nut_x_offset, 0, 0]) {
    // nut wing
    difference() {
        translate([0, 0, nut_wing_z_offset]) {
                cube([1, 7, nut_wing_height], center = true);
        }
        cylinder(h = nut_wing_height, r = nut_radius_wide, $fn = facet_number);
    }

    // nut ledge
    translate([0, 0, nut_segment_height]) {
        difference() {
            cylinder(h = nut_ledge, r = nut_radius_wide, $fn = facet_number);
            cylinder(h = nut_ledge, r = radius_wide, $fn = facet_number);
        }
    }
    
    // nut tooth
    difference() {
        cylinder(h = tooth_height, r = nut_radius_wide, $fn = facet_number);
        intersection() {
            translate([0, 0, nut_tooth_offset]) {cube([cube_width, cube_depth, nut_tooth_height], center = true);}
            cylinder(h = tooth_height, r1 = radius_wide, r2 = radius_narrow, $fn = facet_number);
        }
        difference() {
            cylinder(h = tooth_height, r = radius_wide, $fn = facet_number);
            translate([0, 0, nut_tooth_offset]) {cube([cube_width, cube_depth, nut_tooth_height], center = true);}
        }
    }
}