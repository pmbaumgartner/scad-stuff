$fn = 60;
diameter = 28.8;
height = 17;
thickness = 3;

union()
{
    linear_extrude(height = height) difference()
    {
        offset(thickness) circle(diameter / 2);
        circle(diameter / 2);
    }
    translate([ 0, 0, -thickness ]) linear_extrude(thickness) circle((diameter / 2) + thickness);
}