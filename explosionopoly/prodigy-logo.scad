height = 20;
s = 0.2;

actual_height = height * (1/s);
engrave_height = actual_height * .33;

scale(s)
{
    difference()
    {
        linear_extrude(actual_height)
        {
            hull()
            {
                translate([ 80, 30 ])
                {
                    circle(5);
                }
                translate([ -80, 30 ])
                {
                    circle(5);
                }
                translate([ 80, -30 ])
                {
                    circle(5);
                }
                translate([ -80, -30 ])
                {
                    circle(5);
                }
            }
        }
        translate([ 0, 0, actual_height-engrave_height ])
        {
            linear_extrude(engrave_height*2)
            {
                {
                    import("prodigy_logo.svg", center = true, dpi = 96);
                }
            }
        }
    }
}