wrench_h = 20;
size = 10;
strength = 5;

inlet = 10;

inner_rad = size;
outer_rad = inner_rad + strength;

finger_hold_rad = 5;

difference() {
    cylinder(h = wrench_h, r = outer_rad, $fn = 100);
    translate([0,0,-1]) {
        cylinder(h = wrench_h + 2, r = inner_rad, $fn = 6);
    }
    translate([0, -(inlet/2), -1 ]) 
    cube([outer_rad, inlet, wrench_h + 2]);
}

cylinder(h = wrench_h, r = finger_hold_rad);