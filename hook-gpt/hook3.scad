// Parameters
hook_thickness = 3; // The thickness of the hook
hook_height = 50;   // The height of the hook
hook_curve = 15;    // The curve radius of the hook
hook_base = 20;     // The diameter of the base that attaches to the wall

// Base of the hook
translate([ 0, 0, hook_height ]) cylinder(d = hook_base, h = hook_thickness);

// Vertical part of the hook
translate([ 0, 0, hook_thickness ]) cylinder(d = hook_thickness, h = hook_height - hook_curve);

// Curved part of the hook
translate([ 0, 0, hook_height - hook_curve + hook_thickness ]) rotate([ 0, 0, -90 ]) rotate_extrude($fn = 100)
    translate([ hook_curve, 0, 0 ]) circle(r = hook_thickness / 2);