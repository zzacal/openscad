outer_diameter = 70;

linear_extrude(height = 2) 
difference() {
    translate([0, -10,0]) {
        circle(r = 35);
    }

    translate([0, -10,0]) {
        circle(r = 32);
    } 
    #square([57, 10], center=true);
    #translate([-outer_diameter/2, -outer_diameter,0]) {
        square(size = outer_diameter);
    }
}