$fn = 60;

inner_tolerance = 0.3;
inner_diameter = 10 + inner_tolerance; // Pen - Width also changes as you go up from 9.7 to 10.
outer_diameter = 14.75; // Marker - Width changes depending on where you measure. Bottom = 14.6, Top = 14.8
screw_diameter = 4;     // Screw

diameter_diff = outer_diameter - inner_diameter;
height = 50.5 + 5; // holder top to bottom is 50.5

difference()
{
    cylinder(h = height, r = outer_diameter / 2, center = true);
    cylinder(h = height, r = inner_diameter / 2, center = true);
    translate([ 0, (inner_diameter + (diameter_diff / 2)) / 2, 0 ]) rotate(a = 90, v = [ 1, 0, 0 ])
        cylinder(h = diameter_diff, r = screw_diameter / 2, center = true);
}