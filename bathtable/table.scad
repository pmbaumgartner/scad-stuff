width = 100;
length = 50;
ledge = 75;
thickness = 5;
tall = 50;

cube([ thickness, length, tall ]);

translate([ width + thickness, 0, 0 ]) cube([ thickness, length, tall ]);

difference()
{
    difference()
    {
        translate([ 0, 0, -thickness ]) cube([ width + ledge, length, thickness ]);
        rotate([ 0, -1, 0 ]) translate([ 0, 0, 2 * -thickness ]) cube([ width + ledge, length, thickness ]);
    };
    translate([ width + (ledge * .66), 1 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    // translate([ width + (ledge * .66), 2 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    translate([ width + (ledge * .66), 3 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    // translate([ width + (ledge * .66), 4 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    translate([ width + (ledge * .66), 5 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    // translate([ width + (ledge * .66), 6 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    translate([ width + (ledge * .66), 7 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    // translate([ width + (ledge * .66), 8 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
    translate([ width + (ledge * .66), 9 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
}