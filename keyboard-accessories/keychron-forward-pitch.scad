
// object constraints
keyboard_depth = 112;
palmrest_depth = 80;

// preferences
core_width = 130;
forward_pitch_degrees = 7 ;

// calculable
ramp_height = sin(forward_pitch_degrees) * keyboard_depth;
ramp_base_depth = cos(forward_pitch_degrees) * keyboard_depth;

// palm rest
palmrest_height = ramp_height + 2;
linear_extrude(height = palmrest_height) {
    square([core_width, palmrest_depth]);
}

echo(ramp_height);

// keyboard ramp
translate([0,palmrest_depth,0]) {
    hull() {
        // keyboard ramp base
        linear_extrude(height = 1) 
        square([core_width, ramp_base_depth]);

        // keyboard ramp incline
        translate([0,0,ramp_height]) {
            rotate([-forward_pitch_degrees,0,0]) {
                linear_extrude(height = 1) 
                square([core_width, keyboard_depth]);
            }
        }
    }
}

//lips
lip_height = 3;
lip_depth = 3;

// ramp lip
translate([0, palmrest_depth + ramp_base_depth]) {
    linear_extrude(height = lip_height) {
        square([core_width,lip_depth]);
    }
}

// palm rest lip
translate([0, -lip_depth, 0]) 
linear_extrude(height = palmrest_height + lip_height) 
square([core_width, lip_depth]);
