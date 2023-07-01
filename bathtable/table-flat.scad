width = 100;
length = 150;
ledge = 75;
thickness = 10;
tall = 75;

linear_extrude(height = length) union()
{
    square([ tall, thickness ]);
    translate([ 0, width + thickness, 0 ]) square([ tall, thickness ]);
    translate([ tall, 0, 0 ]) square([ thickness, width + (thickness * 2) ]);
    translate([ tall * .33, width + (2 * thickness), 0 ]) square([ thickness, ledge ]);
}
// translate([ width + thickness, 0, 0 ]) cube([ thickness, length, tall ]);

// difference()
// {
//     difference()
//     {
//         translate([ 0, 0, -thickness ]) cube([ width + ledge, length, thickness ]);
//         rotate([ 0, -1, 0 ]) translate([ 0, 0, 2 * -thickness ]) cube([ width + ledge, length, thickness ]);
//     };
//     translate([ width + (ledge * .66), 1 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     // translate([ width + (ledge * .66), 2 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     translate([ width + (ledge * .66), 3 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     // translate([ width + (ledge * .66), 4 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     translate([ width + (ledge * .66), 5 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     // translate([ width + (ledge * .66), 6 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     translate([ width + (ledge * .66), 7 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     // translate([ width + (ledge * .66), 8 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
//     translate([ width + (ledge * .66), 9 * (length / 10), -thickness ]) cylinder(h = thickness, r = 2);
// }