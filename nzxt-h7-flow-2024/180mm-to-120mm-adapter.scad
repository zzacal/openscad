source_d = 180;
target_d = 140;

window_width = 145;
window_right_gap = 9.5;
center_offset = (source_d - window_width)/2 - window_right_gap;

core_h = 5;

adapter_thickness = 2;

screw_hole_d = 4;

mink_r = 1;

source_through_h = core_h + mink_r * 2;

adapter_x_offset = center_offset + (source_d - target_d) / 2;


difference() {
    translate([0,0,mink_r]) {
        minkowski() {
            sphere(r = mink_rad);
            cube([source_d, source_d, core_h]);
        }
    } 
    
    // Fan hole
    translate([source_d/2, source_d/2,0]) {
        cylinder(h = source_through_h, r = source_d/2);
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
    translate([7.5, 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, d = 7);
    }
    translate([source_d - 7.5, 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, d = 7);
    }
    translate([source_d - 7.5, source_d - 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, d = 7);
    }
    translate([7.5, source_d - 7.5, source_through_h - counter_sink_h]) {
        cylinder(h = counter_sink_h, d = 7);
    }
}

lip_h = 2;
translate([source_d/2, source_d/2, 0]) {
    difference() {
        cylinder(h = source_through_h, r = (source_d/2));
        cylinder(h = source_through_h, r1= (source_d/2),r2 = (source_d/2) - 3);
    }
} 

// // // Adapter extend
// adapter_d = 7.5;
// translate([0,0,source_through_h]) {
//     difference() {
//         union() {
//             translate([adapter_x_offset, source_d - adapter_d, 0]) {
//                 cube([target_d, adapter_d, adapter_thickness]);
//             }

//             translate([adapter_x_offset, 0, 0]) {
//                 cube([target_d, adapter_d, adapter_thickness]);
//             }
//         }
//         // Target Screw hole 1
//         translate([adapter_x_offset + 7.5, 7.5 / 2, 0]) {
//             cylinder(h = source_through_h, d = screw_hole_d);
//         }

//         // Target Screw hole 2
//         translate([adapter_x_offset + target_d - 7.5, 7.5 / 2, 0]) {
//             cylinder(h = source_through_h, d = screw_hole_d);
//         } 

//         // Target Screw hole 3
//         translate([adapter_x_offset + 7.5, source_d - 7.5/2, 0]) {
//             cylinder(h = source_through_h, d = screw_hole_d);
//         }

//         // Target Screw hole 4
//         translate([adapter_x_offset + target_d - 7.5, source_d - 7.5/2, 0]) {
//             cylinder(h = source_through_h, d = screw_hole_d);
//         } 
//         // Fan hole
//         translate([source_d/2, source_d/2,0]) {
//             cylinder(h = source_through_h, r = source_d/2);
//         }

//     }
// } 


