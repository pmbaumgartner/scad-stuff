width = 37.65;
height = 15;
length = 102;
height_down = 27.6;
tol = 1;

union()
{
    linear_extrude(height = height_down / 2) difference()
    {
        offset(3) square([ width + tol, length + tol ], center = true);
        square([ width + tol, length + tol ], center = true);
    };

    translate([ 0, 0, -height_down / 2 ]) linear_extrude(height = height_down / 2) difference()
    {
        offset(3) square([ width, length ], center = true);
        square([ width, length ], center = true);
        square([ width, length + 20 ], center = true);
    };
}