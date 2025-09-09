source_d = 180;
target_d = 140;

window_width = 145;
window_right_gap = 9.5;
center_offset = (source_d - window_width)/2 - window_right_gap;

core_h = 4;

adapter_thickness = 2;

screw_hole_d = 4;

source_through_h = core_h;

adapter_x_offset = center_offset + (source_d - target_d) / 2;

$fn = 100;

lip_h = 2;
difference() {
    union() {
        cube([source_d, source_d, core_h]);
        translate([source_d/2, source_d/2,0]) {
            cylinder(h = source_through_h + lip_h, d = source_d + 2);
        }
    }
    
    // Fan hole
    #translate([source_d/2, source_d/2, -1]) {
        cylinder(h = source_through_h + lip_h + 2, r = source_d/2);
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
        cylinder(h = source_through_h, d = screw_hole_d);
    }

    // Target Screw hole 2
    translate([adapter_x_offset + target_d - 7.5, 7.5 / 2, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    } 

    // Target Screw hole 3
    translate([adapter_x_offset + 7.5, source_d - 7.5/2, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
    }

    // Target Screw hole 4
    translate([adapter_x_offset + target_d - 7.5, source_d - 7.5/2, 0]) {
        cylinder(h = source_through_h, d = screw_hole_d);
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
