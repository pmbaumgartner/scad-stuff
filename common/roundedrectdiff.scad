// This creates a square with inverted rounded edges
// usually for subtracting from something else to give that
// object some rounded corners
module rounded_subtraction_square(height, width, radius, segments = 30)
{
    union()
    {
        // base
        square(size = [ height, width ], center = true);

        // right (y+)
        intersection()
        {

            translate([ 0, (width / 2) + (radius / 2), 0 ])
            {
                square(size = [ height, radius ], center = true);
            }

            difference()
            {
                translate([ 0, (width / 2) + radius, 0 ])
                {
                    square(size = [ height, radius * 2 ], center = true);
                }
                hull()
                {
                    translate([ (height / 2) - radius, (width / 2) + radius, 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                    translate([ -((height / 2) - radius), (width / 2) + radius, 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                }
            }
        }

        // left (y-)
        intersection()
        {

            translate([ 0, -((width / 2) + (radius / 2)), 0 ])
            {
                square(size = [ height, radius ], center = true);
            }

            difference()
            {
                translate([ 0, -((width / 2) + radius), 0 ])
                {
                    square(size = [ height, radius * 2 ], center = true);
                }
                hull()
                {
                    translate([ (height / 2) - radius, -((width / 2) + radius), 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                    translate([ -((height / 2) - radius), -((width / 2) + radius), 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                }
            }
        }
    }
}

module rounded_subtraction_square_top(height, width, radius, segments = 30)
{
    union()
    {
        // base
        square(size = [ height, width ], center = true);

        // right (y+)
        intersection()
        {

            translate([ 0, (width / 2) + (radius / 2), 0 ])
            {
                square(size = [ height, radius ], center = true);
            }

            difference()
            {
                translate([ 0, (width / 2) + radius, 0 ])
                {
                    square(size = [ height, radius * 2 ], center = true);
                }
                hull()
                {
                    translate([ (height / 2) - radius, (width / 2) + radius, 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                    translate([ -((height / 2) - radius) * 2, (width / 2) + radius, 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                }
            }
        }

        // left (y-)
        intersection()
        {

            translate([ 0, -((width / 2) + (radius / 2)), 0 ])
            {
                square(size = [ height, radius ], center = true);
            }

            difference()
            {
                translate([ 0, -((width / 2) + radius), 0 ])
                {
                    square(size = [ height, radius * 2 ], center = true);
                }
                hull()
                {
                    translate([ (height / 2) - radius, -((width / 2) + radius), 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                    translate([ -((height / 2) - radius) * 2, -((width / 2) + radius), 0 ])
                    {
                        circle(r = radius, $fn = segments);
                    }
                }
            }
        }
    }
}

rounded_subtraction_square_top(20, 10, 3);