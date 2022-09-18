scale(0.2)
{
    union()
    {
        linear_extrude(24 + 6)
        {
            import("explosion_logo.svg", center = true, dpi = 96);
        };

        linear_extrude(22)
        {
            translate([ -4, -3 ])
            {
                difference()
                {
                    circle(d = 140, $fn = 50);
                    circle(d = 80, $fn = 50);
                }
            }
        }
    };
}