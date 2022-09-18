use <../common/roundedrectdiff.scad>;
width = 66;
height = 88;
depth = 30;
margin = 1;
buffer = 4;
thickness = 0.4 * buffer;

union()
{
    difference()
    {
        linear_extrude(depth + thickness)
        {
            difference()
            {
                offset(thickness)
                {
                    square([ width + margin, height + margin ], center = true);
                }
                square([ width + margin, height + margin ], center = true);
            }
        }

        // translate([ 0, 0, 0 ])
        // {
        //     linear_extrude(height = thickness + depth + 1)
        //     {
        //         translate([ 0, height / 2, 0 ])
        //         {
        //             square([ 20, 20 ], center = true);
        //         }
        //     }
        // }
        color("red")
        {
            translate([ 0, (height / 2) + (thickness * 1.4), (thickness / 2) + (depth / 2) ])
            {
                rotate([ 90, 90, 0 ])
                {
                    linear_extrude(thickness * 2)
                    {
                        {
                            rounded_subtraction_square(height = thickness + depth + 0.1, width = 38, radius = 3);
                        }
                    }
                }
            }
        }
        color("green")
        {
            translate([ 0, -((height / 2)), (thickness / 2) + (depth / 2) ])
            {
                rotate([ 90, 90, 0 ])
                {
                    linear_extrude(thickness * 2)
                    {
                        {
                            rounded_subtraction_square(height = thickness + depth + 0.1, width = 38, radius = 3);
                        }
                    }
                }
            }
        }
        color("green")
        {
            translate([ width / 2, 0, (thickness / 2) + (depth / 2) ])
            {
                rotate([ 90, 90, 90 ])
                {
                    linear_extrude(thickness * 2)
                    {
                        {
                            rounded_subtraction_square(height = thickness + depth + 0.1, width = 60, radius = 3);
                        }
                    }
                }
            }
        }
        color("green")
        {
            translate([ -(width / 2) - thickness * 1.4, 0, (thickness / 2) + (depth / 2) ])
            {
                rotate([ 90, 90, 90 ])
                {
                    linear_extrude(thickness * 2)
                    {
                        {
                            rounded_subtraction_square(height = thickness + depth + 0.1, width = 60, radius = 3);
                        }
                    }
                }
            }
        }
    }

    linear_extrude(thickness)
    {
        square([ width + margin, height + margin ], center = true);
    }
}