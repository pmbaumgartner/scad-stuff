























































































use </Users/peter/projects/py-open-scad/cupholder/../common/roundedrectdiff.scad>

$fn = 100;

cork_diameter = 90; // Inner cork_diameter of cork
cork_height = 3.5;  // Do not change this

buffer = 0;    // Buffer to add to inner cork_diameter
outer = 4;     // Additional diameter to add outside diameter + buffer
thickness = 3; // Thickness of the coaster

wall_height = thickness + cork_height;

module svg()
{
    import("/Users/peter/projects/py-open-scad/coaster-cork/voronoi-1-2023-02-12 09-57-19.svg");
}
// The full circle
union()
{
    translate([ 0, 0, thickness / 2 ])
    {
        difference()
        {
            cylinder(h = thickness, d = cork_diameter + buffer + outer, center = true);
            translate([ -40, -40, -(0.5 * wall_height) ]) linear_extrude(height = wall_height)
            {
                svg();
            }
        }
    }
    linear_extrude(height = wall_height)
    {

        difference()
        {
            offset(delta = outer)
            {
                circle(d = cork_diameter + buffer);
            };
            circle(d = cork_diameter + buffer);
        }
    }
}