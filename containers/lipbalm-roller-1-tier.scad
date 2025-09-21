// object constraints
lip_balm_diameter = 17;

// preferences
outer_height = 25;
outer_edge_rad = 2;
inner_height = 50;
inner_thickness = 1;
lip_balm_holster_diameter = 60;
inner_rad = 20;
lipbalm_holster_count = 10;
$fn = 100;


// Calculations
lip_balm_holster_rad = lip_balm_holster_diameter / 2;
lipbalm_holster_angular_interval = 360 / lipbalm_holster_count;

walled_diameter = 1+ lip_balm_holster_diameter + lip_balm_diameter;

difference() {
    union() {
        minkowski() {
            linear_extrude(height = outer_height - outer_edge_rad) {
                circle(d = walled_diameter - outer_edge_rad);
            }
            // cylinder(h = outer_height - 5, r = (walled_diameter - 5) / 2);
            sphere(r = outer_edge_rad);
        }
        linear_extrude(height = inner_height) {
            circle(r = inner_rad);
        }
    }

    linear_extrude(height = outer_height) {
    for (i = [0 : lipbalm_holster_count - 1]) {
        angle = i * lipbalm_holster_angular_interval;
        translate([lip_balm_holster_rad*cos(angle),lip_balm_holster_rad*sin(angle), 0]) {
            circle(d = lip_balm_diameter);
        }
    }
    } 
    linear_extrude(height = inner_height)
    circle(r = inner_rad - inner_thickness);
}
