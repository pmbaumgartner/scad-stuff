// Parameters
wall_thickness = 5; // The thickness of the base that attaches to the wall
hook_thickness = 3; // The thickness of the hook
hook_radius = 15;   // The radius of the hook
height = 40;        // The height of the hook

// Base of the hook
cube([ wall_thickness, hook_radius * 2, height ]);

// Curved part of the hook
translate([ wall_thickness, hook_radius, height / 2 ]) rotate([ 0, 0, -90 ])
    cylinder(r = hook_thickness, h = hook_radius * 2, $fn = 100);

// Straight part of the hook
translate([ wall_thickness + hook_radius, hook_radius, height / 2 - hook_thickness / 2 ])
    cube([ hook_radius, hook_thickness, hook_thickness ]);