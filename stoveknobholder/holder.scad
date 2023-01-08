$fn = 60;

dp = 51;
d = 53;
rwidth = 10;
height = 8;
tolerance = 1;
space = 8;

buffer = 1;
outer_d = 12;

module knob(diameter, outcrop_height, outcrop_width, tol)
{
    union()
    {
        circle(d = outcrop_height + tol);
        translate([ (diameter - outcrop_height), 0, 0 ]) square([ diameter + tol, outcrop_width + tol ], center = true);
    }
}

linear_extrude(height)
{
    difference()
    {
        hull()
        {
            translate(v = [ -((d / 2) + buffer), -((d / 2) + buffer) ]) circle(d = outer_d);
            translate(v = [ -((d / 2) + buffer), ((d / 2) + buffer) ]) circle(d = outer_d);
            translate(v = [ (dp + space) + ((d / 2) + buffer), ((d / 2) + buffer) ]) circle(d = outer_d);
            translate(v = [ (dp + space) + ((d / 2) + buffer), -((d / 2) + buffer) ]) circle(d = outer_d);
        };
        knob(d, dp, rwidth, tolerance);
        translate([ dp + space, 0, 0 ])
        {
            knob(d, dp, rwidth, tolerance);
        };
    }
}