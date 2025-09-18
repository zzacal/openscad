
// object constraints
keyboard_depth = 112;
keyboard_aluminum_case_depth = 9;
palmrest_depth = 80;

// preferences
core_width = 230;
forward_pitch_degrees = 7 ;
palmrest_elevation = 7;
wall_width = 3;

// calculable
ramp_slope_depth = keyboard_depth + keyboard_aluminum_case_depth;
ramp_height = sin(forward_pitch_degrees) * ramp_slope_depth;
ramp_base_depth = cos(forward_pitch_degrees) * ramp_slope_depth;
stage_depth = palmrest_depth;

// palm rest
palmrest_height = ramp_height + palmrest_elevation + 1;

difference() {
    linear_extrude(height = palmrest_height) {
        square([core_width, stage_depth]);
    }

    translate([wall_width, wall_width, 0]) 
    linear_extrude(height = palmrest_height) {
        square([core_width - wall_width * 2, stage_depth - wall_width * 2]);
    }
}

echo(ramp_height);

// keyboard ramp
difference() {
translate([0,stage_depth,0]) {
    hull() {
        // keyboard ramp base
        linear_extrude(height = 1) 
        square([core_width, ramp_base_depth]);

        // keyboard ramp incline
        translate([0,0,ramp_height]) {
            rotate([-forward_pitch_degrees,0,0]) {
                linear_extrude(height = 1) 
                square([core_width, ramp_slope_depth]);
            }
        }
    }
}

translate([wall_width,stage_depth,0]) {
    hull() {
        // keyboard ramp base
        linear_extrude(height = 1) 
        square([core_width - wall_width * 2, ramp_base_depth - wall_width * 2]);

        // keyboard ramp incline
        translate([0,0,ramp_height]) {
            rotate([-forward_pitch_degrees,0,0]) {
                linear_extrude(height = 2) 
                square([core_width - wall_width * 2, ramp_slope_depth - wall_width * 2]);
            }
        }
    }
}
}

//lips
lip_height = 3;
lip_depth = 3;

// ramp lip
translate([0, stage_depth + ramp_base_depth]) {
    linear_extrude(height = lip_height) {
        square([core_width,lip_depth]);
    }
}

// palm rest lip
translate([0, -lip_depth, 0]) 
linear_extrude(height = palmrest_height + lip_height) 
square([core_width, lip_depth]);
