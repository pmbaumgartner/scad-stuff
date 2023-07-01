$fn = 60;

VOLUME = 74 * 1000;
HEIGHT = 61;
RADIUS = sqrt(VOLUME / (PI * HEIGHT));

THICKNESS = 5;

echo(RADIUS);

union()
{
    linear_extrude(height = HEIGHT)
    {
        difference()
        {
            offset(THICKNESS)
            {
                circle(r = RADIUS);
            }
            circle(r = RADIUS);
        }
    }
    translate(v = [ 0, 0, -5 ])
    {
        linear_extrude(height = THICKNESS)
        {
            circle(r = RADIUS + THICKNESS);
        };
    };
}