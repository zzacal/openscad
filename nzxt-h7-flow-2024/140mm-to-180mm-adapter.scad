source_d = 180;
target_d = 140;

window_width = 145;
window_right_gap = 9.5;

core_h = 5;

adapter_thickness = 2;

screw_hole_d = 4;

source_through_h = core_h;

$fn = 100;

lip_h = 4;
lip_padding = 4;
lip_thickness = 5;

lip_d = source_d + lip_padding;

target_screwhole_lip_h = lip_h;
target_screwhole_lip_thickness = 5;

center_offset = (lip_d - window_width)/2 - window_right_gap;
adapter_x_offset = center_offset + (source_d - target_d) / 2;

difference() {
    union() {
        cube([source_d, source_d, core_h]);

        // Lip
        translate([source_d/2, source_d/2,0]) {
            cylinder(h = source_through_h + lip_h, d = lip_d);
        }

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

    }
    
    // Fan hole
    #translate([source_d/2, source_d/2, 0]) {
        cylinder(h = source_through_h - 1, r1 = source_d/2, r2 = source_d/2 - 3);
    }

    // Lip hole
    translate([source_d/2, source_d/2, source_through_h - 2]) {
        cylinder(h = lip_h + 3, d = source_d - 5);
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
    counter_sink_h = 2;
    counter_sink_r = 4;
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
