$fn = 60;

buffer = 5;
thickness = 0.4 * buffer;
separator = thickness;
box_x = 25; // Save room for wall
box_y = 25; // Toothbrush Length
z = 22;     // Tallest thing is the toothpaste tube

INNER_TOLERANCE = 0.4; // 0.2 is almost too tight

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
        }
    }
}

// Top

// bottom
translate([ box_x + (0.5 * box_x), 0, 0 ]) union()
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
            offset(thickness + INNER_TOLERANCE) square([ box_x, box_y ]);
        }
    }
}