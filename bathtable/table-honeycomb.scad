include <honeycomb.scad>

width = 100;
length = 175;
ledge = 75;
thickness = 5;
tall = 50;
border = 1;

module the_honey()
{
    honeycomb(width + ledge, length, 25, 2);
}

union()
{
    // intersection()
    // {
    //     linear_extrude(height = tall) the_honey();
    //     cube([ thickness, length, tall ]);
    // }
    // intersection()
    // {
    //     linear_extrude(height = tall) the_honey();
    //     translate([ width + thickness, 0, 0 ]) cube([ thickness, length, tall ]);
    // }
    difference()
    {
        translate([ 0, 0, -thickness ]) linear_extrude(height = tall + thickness) square([ thickness, length ]);
        translate([ 0, 0, -thickness ]) linear_extrude(height = tall + thickness) offset(-border)
            square([ thickness, length ]);
    }
    difference()
    {
        translate([ 0, 0, -thickness ]) linear_extrude(height = tall + thickness) translate([ width + thickness, 0, 0 ])
            square([ thickness, length ]);
        translate([ 0, 0, -thickness ]) linear_extrude(height = tall + thickness) offset(-border)
            translate([ width + thickness, 0, 0 ]) square([ thickness, length ]);
    }
    translate([ 0, 0, -thickness ]) linear_extrude(height = thickness) the_honey();
    difference()
    {
        translate([ 0, 0, -thickness ]) linear_extrude(height = thickness) square([ width + ledge, length ]);
        translate([ 0, 0, -thickness ]) linear_extrude(height = thickness) offset(-border)
            square([ width + ledge, length ]);
    }
}
// # width + ledge, length, thickness