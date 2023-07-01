// Parameters
hook_thickness = 3; // The thickness of the hook
hook_height = 50;   // The overall height of the hook
hook_width = 20;    // The width of the hook
hook_curve = 15;    // The curve of the hook (how far it extends outward)
hook_base = 10;     // The thickness of the base that attaches to the wall

// Base of the hook
translate([ 0, 0, hook_height - hook_base ]) cube([ hook_width, hook_curve, hook_base ]);

// Vertical part of the hook
hull()
{
    translate([ hook_width / 2, hook_curve, 0 ])
        cylinder(h = hook_height - hook_curve - hook_base / 2, r = hook_thickness / 2);

    translate([ hook_width / 2, hook_curve, hook_height - hook_curve - hook_base / 2 ])
        cylinder(h = hook_curve, r = hook_thickness / 2);
}

// Curved part of the hook
hull()
{
    translate([ hook_width / 2, hook_curve, hook_height - hook_base ]) cylinder(h = 1, r = hook_thickness / 2);

    translate([ hook_width / 2 - hook_curve, hook_curve, hook_height - hook_base / 2 ])
        cylinder(h = 1, r = hook_thickness / 2);
}