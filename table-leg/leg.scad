$fn = 100;
diameter = 47;
buffer = 1;
outer = 4;
thickness = 3;
wall_height = thickness * 2;

// The full circle
union()
{
    translate([ 0, 0, thickness / 2 ])
    {
        cylinder(h = thickness, d = diameter + buffer + outer, center = true);
    };
    linear_extrude(height = wall_height)
    {
        difference()
        {
            offset(delta = outer)
            {
                circle(d = diameter + buffer);
            };
            circle(d = diameter + buffer);
        }
    }
}