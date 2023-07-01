// Parameters
hook_thickness = 3; // The thickness of the hook
hook_height = 50;   // The overall height of the hook
hook_width = 20;    // The width of the hook
hook_curve = 20;    // The curve of the hook (how far it extends outward)
hook_base = 10;     // The thickness of the base that attaches to the wall

difference()
{
    // Base of the hook
    translate([ 0, 0, hook_height - hook_base ]) cube([ hook_width, hook_curve, hook_base ]);

    // Vertical part of the hook
    translate([ 0, hook_curve - hook_thickness, 0 ]) cube([ hook_thickness, hook_thickness, hook_height ]);

    // Curved part of the hook
    translate([ 0, 0, hook_height - hook_base - hook_thickness ]) rotate([ 0, 0, 180 ])
        rotate_extrude(convexity = 10, $fn = 100) translate([ hook_thickness, 0, 0 ])
            circle(r = hook_curve - hook_thickness);

    // Subtracting a small inner portion to hollow the hook
    // Vertical part
    translate([ hook_thickness, hook_curve, 0 ]) cube([ hook_thickness - 1, hook_thickness - 1, hook_height - 1 ]);

    // Curved part
    translate([ 0, 0, hook_height - hook_base - hook_thickness ]) rotate([ 0, 0, 180 ])
        rotate_extrude(convexity = 10, $fn = 100) translate([ hook_thickness + 1, 0, 0 ])
            circle(r = hook_curve - hook_thickness);
}