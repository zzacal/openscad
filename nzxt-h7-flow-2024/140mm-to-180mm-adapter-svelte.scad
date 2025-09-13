source_d = 180;
target_d = 140;

window_width = 145;
window_right_gap = 9.5;

core_h = 3;

screw_hole_d = 4;

source_through_h = core_h;

$fn = 10;

target_screwhole__to_mount_h = 2;
target_screwhole_lip_h = target_screwhole__to_mount_h;
target_screwhole_lip_thickness = 5;

back_lip_w = 2;
back_lip_h = 6;

center_offset = (source_d - window_width)/2 - window_right_gap - back_lip_w;
adapter_x_offset = center_offset + (source_d - target_d) / 2;

counter_sink_h = 2;
counter_sink_r = 4;

difference() {
    union() {
        cube([source_d, source_d, core_h]);

        // Target Screw lip hole 1
        translate([adapter_x_offset + 7.5, 7.5 / 2, 0]) {
            cylinder(h = source_through_h + target_screwhole_lip_h, d = screw_hole_d + target_screwhole_lip_thickness);
        }

        // Target Screw lip hole 2
        translate([adapter_x_offset + target_d - 7.5, 7.5 / 2, 0]) {
            cylinder(h = source_through_h + target_screwhole_lip_h, d = screw_hole_d + target_screwhole_lip_thickness);
        } 

        // Target Screw lip hole 3
        translate([adapter_x_offset + 7.5, source_d - 7.5/2, 0]) {
            cylinder(h = source_through_h + target_screwhole_lip_h, d = screw_hole_d + target_screwhole_lip_thickness);
        }

        // Target Screw lip hole 4
        translate([adapter_x_offset + target_d - 7.5, source_d - 7.5/2, 0]) {
            cylinder(h = source_through_h + target_screwhole_lip_h, d = screw_hole_d + target_screwhole_lip_thickness);
        }

        // Back lip
        translate([-back_lip_w,-back_lip_w,-back_lip_h]) 
        linear_extrude(height = core_h + back_lip_h) {
            square(size = source_d + back_lip_w * 2);
        }
    }
    
    // Fan hole
    translate([source_d/2, source_d/2, -1]) {
        cylinder(h = source_through_h + 2, r = source_d/2 + 10);
    }

    // Corner gaps
    translate([0,0,-back_lip_h-1]) {
        linear_extrude(height = source_through_h + 2 + back_lip_h)  {
            // y-spanning
            translate([source_d/2-1, source_d/2-1,0]) {
                square([source_d + 2 + back_lip_w * 2, source_d - 40 +2], center=true);
            }

            // x gap
            translate([source_d/2-1 + center_offset, source_d/2-1,0]) {
                square([source_d - 70 + 2, source_d + 2 + back_lip_w * 2], center=true);
            }
        }
    }

    translate([0,0,-back_lip_h]) {
        linear_extrude(height = back_lip_h) {
            square(size = source_d);
        }
    }

    #translate([7.5 + counter_sink_r + 2, - back_lip_w - 1, 0]) {
        linear_extrude(height = core_h + 1) {
            square([15, source_d + back_lip_w * 2 + 2]);
        }
    } 

    // Source Screw hole 1
    translate([7.5, 7.5, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    }



    // Source Screw hole 2
    translate([source_d - 7.5, 7.5, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    }

    // Source Screw hole 3
    translate([source_d - 7.5, source_d - 7.5, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    }


    // Source Screw hole 4
    translate([7.5, source_d - 7.5, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    }

    // Target Screw hole 1
    translate([adapter_x_offset + 7.5, 7.5 / 2, 0]) {
        cylinder(h = source_through_h + target_screwhole_lip_h + 1, d = screw_hole_d);
    }

    // Target Screw hole 2
    translate([adapter_x_offset + target_d - 7.5, 7.5 / 2, 0]) {
        cylinder(h = source_through_h + target_screwhole_lip_h + 1, d = screw_hole_d);
    } 

    // Target Screw hole 3
    translate([adapter_x_offset + 7.5, source_d - 7.5/2, 0]) {
        cylinder(h = source_through_h + target_screwhole_lip_h + 1, d = screw_hole_d);
    }

    // Target Screw hole 4
    translate([adapter_x_offset + target_d - 7.5, source_d - 7.5/2, 0]) {
        cylinder(h = source_through_h + target_screwhole_lip_h + 1, d = screw_hole_d);
    }

    // Source Screwhole Countersinks
    translate([7.5, 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, r = counter_sink_r);
    }
    translate([source_d - 7.5, 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, r = counter_sink_r);
    }
    translate([source_d - 7.5, source_d - 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, r = counter_sink_r);
    }
    translate([7.5, source_d - 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, r = counter_sink_r);
    }
}
