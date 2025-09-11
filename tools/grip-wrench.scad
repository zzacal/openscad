wrench_h = 12;
size = 27;
strength = 10;

inlet = 15;

inner_rad = size/2;
outer_rad = inner_rad + strength;

finger_hold_rad = 5;

label = str(size);

difference() {
    cylinder(h = wrench_h, r = outer_rad, $fn = 100);
    translate([0,0,-1]) {
        cylinder(h = wrench_h + 2, r = inner_rad, $fn = 6);
    }
    translate([0, -(inlet/2), -1 ]) {
        cube([outer_rad, inlet, wrench_h + 2]);
    }
    for (i = [1 : 7]) {
        angle = i * 45;
        translate([outer_rad*cos(angle),outer_rad*sin(angle), -1]) {
            cylinder(h = wrench_h + 2, r = finger_hold_rad, $fn = 10);
        }
    }
}

translate([0,inner_rad,wrench_h]) {
    linear_extrude(height = 0.4) 
    text(label, 4, halign = "center");
}
