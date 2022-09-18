$fn = 60;

walls = 5;
thickness = 0.4 * walls;
buffer = 1;
toothbrush_width = 15.5 + buffer;
picks_width = 40 + buffer;
picks_y = 85 + buffer; // Container is 87, picks are ~80
toothpaste_y = 100;
toothpaste_width = 40 + buffer;
separator = thickness;
box_x = 108.2 + buffer;                                                            // Longest thing is toothbrush
box_y = picks_width + thickness + toothbrush_width + thickness + toothpaste_width; // Everything added together
z = 25; // Tallest thing is the toothpaste tube

gap = 30;
outer_gap = 30;

inner_tolerance_lid = 0.2;

union()
{
    // bottom
    translate([ 0, 0, -thickness ])
    {
        linear_extrude(height = thickness)
        {
            offset(thickness) offset(thickness) square([ box_x, box_y ]);
        }
    }

    // OUTER BOX
    linear_extrude(height = z)
    {
        difference()
        {
            offset(thickness) square([ box_x, box_y ]);
            square([ box_x, box_y ]);
            translate([ gap / 2, -thickness ]) square([ box_x - gap, thickness ]);
            translate([ gap / 2, box_y ]) square([ box_x - gap, thickness ]);
            translate([ -thickness, gap / 2 ]) square([ thickness, box_y - gap ]);
            translate([ box_x, gap / 2 ]) square([ thickness, box_y - gap ]);
        }
    }

    linear_extrude(height = z / 2)
    {
        difference()
        {
            offset(thickness) square([ box_x, box_y ]);
            square([ box_x, box_y ]);
        }
    }

    // Floss Pick Oval
    linear_extrude(height = z)
    {
        translate([ box_x / 2, picks_width / 2 ])
        {
            difference()
            {
                offset(thickness) scale([ 2.6, 1 ]) circle(d = 10 - (thickness));
                scale([ 2.6, 1 ]) circle(d = 10 - (thickness));
            }
        }
    }

    // First wall: Picks to toothpaste
    // OUTER BOX
    difference()
    {
        linear_extrude(height = z)
        {
            translate([ 0, picks_width ])
            {
                square([ box_x, thickness ]);
            }
        }

        // linear_extrude(height = z / 2)
        // {
        //     translate([ gap / 2, picks_width ])
        //     {
        //         square([ box_x - gap, thickness ]);
        //     }
        // }
    }

    // First wall: Toothbrush to Toothpaste
    difference()
    {
        linear_extrude(height = z / 2)
        {
            translate([ 0, picks_width + thickness + toothbrush_width ])
            {
                square([ box_x, thickness ]);
            }
        }
        linear_extrude(height = z / 2)
        {
            translate([ gap / 2, picks_width + thickness + toothbrush_width ])
            {
                square([ box_x - gap, thickness ]);
            }
        }
    }
}

// Top
translate([ box_x + (0.1 * box_x), 0, 0 ]) union()
{
    translate([ 0, 0, -thickness ])
    {
        linear_extrude(height = thickness)
        {

            offset(thickness) offset(thickness) square([ box_x, box_y ]);
        }
    }
    translate([ 0, 0, 0 ]) linear_extrude(height = z)
    {
        difference()
        {
            offset(thickness) offset(thickness) square([ box_x, box_y ]);
            offset(thickness + inner_tolerance_lid) square([ box_x, box_y ]);
        }
    }
}