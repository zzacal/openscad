width = 30;
depth = 35;

strength = 5;

pusher_w = 20;

puller_w = 20;

linear_extrude(height = 20) {
    difference() {
        square([width+(strength), depth+(strength*2)]);
        translate([strength, strength, 0]) {
            square([width, depth]);
        } 
    }
    translate([width, depth+strength]) {
        square([strength, pusher_w]);
    }
    translate([width, -(puller_w/2), 0]) {
        square([strength, puller_w]);
    }
}
