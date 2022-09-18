// Desk Cable Hugger v3

// Customizable desk hugger to organize cables.

// v1: https://www.thingiverse.com/thing:782152
// v2: https://www.thingiverse.com/thing:5256328

/* [Object Parameters] */
// Thickness of desktop (mm)
desk_thickness = 26; // [1:100]

// Gap for inserting cables (mm)
cable_gap = 5;

// Angle of the top of the clamp so that it has a better grip on the table (degrees)
clamp_angle = 3; // [0:10]

// Diameter of the bottom half circle
diameter_holder = 40;

// Width of the desk hugger (z-height)
clamp_width = 40;

// Offset added to desk_thickness
clamp_offset = 0;

/* [Printer Parameters] */
// Diameter of the printer nozzle 
nozzle = 0.4;
// Number of lines to be printed
n_lines = 6;

// Derived Variables
thickness = n_lines * nozzle;
desk_width = desk_thickness - clamp_offset;

// Rename variables for brevity
w = clamp_width;
d = diameter_holder;
r = d / 2;
l = desk_width + r;
t = -clamp_angle;

module top(thickness, length, angle)
{
    rotate(a = [ 0, 0, t ])
    {
        square(size = [ thickness, d ]);
    }
}

linear_extrude(w)
{
    union()
    {
        // To remove any outcropping from rotating the top square
        // We will find the difference between the top bracket and any
        // solid NOT in both the top and the left part of the bracket
        // That is, in the corner, any solid must be part of both the top
        // and the left part of the bracket, not either individually
        // This removes material that appeares to the "left" (negative on the y-axis).
        difference()
        {
            top(thickness, d, t);
            difference()
            {
                // This x-length is deliberately thickness * 3,
                // not * 2, beacuse extreme angles can have an outcrop
                square(center = true, size = [ thickness * 3, thickness * 2 ]);
                intersection()
                {
                    top(thickness, d, t);
                    square(size = [ l, thickness ]);
                }
            }
        }
        // We apply the same logic here, but with the left square. Any material
        // not in both the top and left bracket is excluded. This removes material
        // from rotating that appears "above" (negative on the x-axis) the hook.
        difference()
        {
            square(size = [ l, thickness ]);
            difference()
            {
                square(center = true, size = [ thickness * 2, thickness * 2 ]);
                intersection()
                {
                    top(thickness, d, t);
                    square(size = [ l, thickness ]);
                }
            }
        }
        // This creates the half circle for the hook
        difference()
        {
            translate(v = [ l, r ])
            {
                circle($fn = 100, d = d);
            }
            translate(v = [ l, r ])
            {
                circle($fn = 100, d = d - (thickness * 2));
            }
            // This removes the upper half of the circle to create the semi-circle
            translate(v = [ desk_width + (r / 2), r ])
            {
                square(center = true, size = [ r, d ]);
            }
        }
        // This is the part that extends up from the semi-circle
        translate(v = [ desk_width, d - thickness ])
        {
            square(size = [ r, thickness ]);
        }
        // This is the part that goes under the desk, and is
        // the diameter of the hook minus the cable gap
        // We must offset by thickness + cable gap
        translate(v = [ desk_width, thickness + cable_gap ])
        {
            square(size = [ thickness, d - cable_gap - thickness ]);
        }
    }
}