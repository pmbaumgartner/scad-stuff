base_length = 42;       // 1 11/16th inch, rounded down
thickness = 1.5875 * 3; // 1/16th inch * new
lift_height = 30;
handle_length = 42;
height = 25.4;
base_to_end = 55;
hdist = base_to_end - handle_length;

linear_extrude(height) union()
{
    square([ base_length, thickness ]);
    hull()
    {
        translate([ base_length - thickness, 0, 0 ]) square([ thickness, thickness ]);
        translate([ base_length + hdist - thickness, lift_height ]) square([ thickness, thickness ]);
    }
    translate([ base_length + hdist - thickness, lift_height ]) square([ handle_length, thickness ]);
    translate([ base_length + hdist + handle_length - thickness, lift_height + (thickness / 2) ]) circle(r = thickness);
}