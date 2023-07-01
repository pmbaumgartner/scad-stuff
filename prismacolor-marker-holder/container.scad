$fn = 100;
tol = 0.5;
lower_diameter = 14.6;
upper_diameter = 16.6;
lower_radius = (lower_diameter / 2) + tol;
upper_radius = (upper_diameter / 2) + tol;
height = 30;
exterior = 1.5;

circle_offset = (upper_radius - lower_radius);

difference()
{
    linear_extrude(height = height) square(upper_diameter + exterior, center = true);
    linear_extrude(height = height) union()
    {
        translate([ 0, 0, 0 ]) circle(lower_radius);
        difference()
        {
            translate([ circle_offset, 0, 0 ]) circle(upper_radius);
            translate([ 0, -upper_radius, 0 ]) square([ upper_radius * 2, upper_radius * 2 ]);
            translate([ -upper_radius, -upper_radius, 0 ]) square([ upper_radius * 2, upper_radius ]);
        }
    }
}

// color("green") translate([ circle_offset + tol, 0, 0 ]) circle(upper_radius);
// color("blue") translate([ circle_offset, 0, 0 ]) circle(upper_radius);