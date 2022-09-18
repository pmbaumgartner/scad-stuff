size = 30.5;
thread = 0.4;
thickness = 6;
inset = size * 0.15;
length = size / 2;
screw_d = 5;

offset_ = thread * thickness;

inner_screw = 3.75;
outer_cylinder = 6.75;
nail_head = thread * 3; // 1.2 mm
nail_length = 3;        // 3 mm until head

union()
{
    linear_extrude(size)
    {
        difference()
        {
            offset(offset_)
            {
                square(size = size, center = true);
            }
            square(size = size, center = true);
            hull()
            {
                translate([ (size / 2) - (inset), size - (length / 2) ])
                {
                    square([ offset_, length ], center = true);
                };
                translate([ -((size / 2) - (inset)), size - (length / 2) ])
                {
                    square([ offset_, length ], center = true);
                };
            }
        }
    }

    difference()
    {
        linear_extrude(size)
        {
            translate([ (size / 2) - (inset), size - (length / 2) ])
            {
                square([ offset_, length ], center = true);
            };
            translate([ -((size / 2) - (inset)), size - (length / 2) ])
            {
                square([ offset_, length ], center = true);
            };
        };
        translate([ 0, (size / 2) + (length / 2), size / 2 ])
        {
            rotate([ 0, 90, 0 ])
            {
                cylinder(h = size, r = screw_d / 2, center = true, $fn = 50);
            }
        }
    }
    {
        translate([ 0, -((size / 2) + (offset_ * 1.5)), size / 2 ])
        {
            rotate([ 90, 0, 0 ])
            {
                union()
                {
                    cylinder(h = nail_length, d = inner_screw, center = true);
                    translate([ 0, 0, nail_length / 2 ])
                    {
                        cylinder(h = nail_head, d = outer_cylinder, center = true);
                    }
                }
            }
        }
    }
}