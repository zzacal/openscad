source_d = 180;
target_d = 120;
center_offset = (source_d - target_d)/2 - 9.5;

core_h = 1;

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


    // Source Screw hole 3
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
}

// // Adapter extend
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


