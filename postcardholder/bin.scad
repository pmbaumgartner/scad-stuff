use <../common/roundedrectdiff.scad>;

// Version 2
// Printed Version (2022-08-03) had margin = 1
inch = 25.4;
in4 = 101.6;
in6 = 152.4;
// width and height from top
// width = x, height = y
width = inch * 1.5;
height = in4;
// depth = tallness
depth = 3 * inch;
margin = 2;
buffer = 5;
thickness = 0.4 * buffer;
// single corner width, x2 is what's taken out each side
corner_width = 12;
corner_width_total = corner_width * 2;
fence_height = 10;

// 4 in = 101.6mm
// 6in = 152.4mm

module bin(x, y, z, fence_height, margin, corner_width, buffer, nozzle_width = 0.4)
{
    thickness = nozzle_width * buffer;
    union()
    {
        difference()
        {
            linear_extrude(z + thickness)
            {
                difference()
                {
                    offset(delta = thickness)
                    {
                        square([ x + margin, y + margin ], center = true);
                    }
                    square([ x + margin, y + margin ], center = true);
                }
            }

            color()
            {
                translate([ 0, (y / 2) + (thickness * 1.4), (thickness / 2) + (z / 2) ])
                {
                    rotate([ 90, 90, 0 ])
                    {
                        linear_extrude(thickness * 3)
                        {
                            {
                                rounded_subtraction_square(height = thickness + z + 0.1, width = x - corner_width_total,
                                                           radius = 3);
                            }
                        }
                    }
                }
            }
            color()
            {
                translate([ 0, -((y / 2)), (thickness / 2) + (z / 2) ])
                {
                    rotate([ 90, 90, 0 ])
                    {
                        linear_extrude(thickness * 3)
                        {
                            {
                                rounded_subtraction_square(height = thickness + z + 0.1, width = x - corner_width_total,
                                                           radius = 3);
                            }
                        }
                    }
                }
            }
            color()
            {
                translate([ (x / 2) - (thickness), 0, (thickness / 2) + (z / 2) ])
                {
                    rotate([ 90, 90, 90 ])
                    {
                        linear_extrude(thickness * 3)
                        {
                            {
                                rounded_subtraction_square(height = thickness + z + 0.1, width = y - corner_width_total,
                                                           radius = 3);
                            }
                        }
                    }
                }
            }
            color()
            {
                translate([ -((x / 2) + (thickness*2)), 0, (thickness / 2) + (z / 2) ])
                {
                    rotate([ 90, 90, 90 ])
                    {
                        linear_extrude(thickness * 3)
                        {
                            {
                                rounded_subtraction_square(height = thickness + z + 0.1, width = y - corner_width_total,
                                                           radius = 3);
                            }
                        }
                    }
                }
            }
        }

        linear_extrude(thickness)
        {
            difference() {
            square([ x + margin, y + margin ], center = true);
            square([ x + margin, y + margin - corner_width * 2 ], center = true);

            }
        }

        linear_extrude(fence_height)
        {
            difference()
            {
                offset(delta = thickness)
                {
                    square([ x + margin, y + margin ], center = true);
                }
                square([ x + margin, y + margin ], center = true);
            }
        }
    }
}

union()
{
    bin(width, height, depth, fence_height, margin, corner_width, buffer);
    translate([ width + (thickness * 1.5), 0, 0 ])
    {
        bin(width, height, depth, fence_height, margin, corner_width, buffer);
    }
    translate([ 2 * (width + (thickness * 1.5)), 0, 0 ])
    {
        bin(width, height, depth, fence_height, margin, corner_width, buffer);
    }
    translate([ 3 * (width + (thickness * 1.5)), 0, 0 ])
    {
        bin(width, height, depth, fence_height, margin, corner_width, buffer);
    }
}

