$fn = 60;

buffer = 5;
thickness = 0.4 * buffer;
toothbrush_width = 20;
picks_width = 40;
picks_y = 85; // Container is 87, picks are ~80
toothpaste_y = 100;
separator = thickness;
box_x = picks_width + thickness + toothbrush_width; // Save room for wall
box_y = 202;                                        // Toothbrush Length
z = 22;                                             // Tallest thing is the toothpaste tube
picks_paste_gap = box_y - picks_y - toothpaste_y;

union()
{
    // TODO: Doesn't need to be full wall
    translate(v = [ (box_x / 2) - toothbrush_width + (thickness / 2), 0, 0 ])
    {
        linear_extrude(height = z)
        {
            square([ thickness, box_y ], center = true);
        }
    }

    // Gap Fill
    translate(v = [
        -(box_x / 2) + toothbrush_width + (thickness / 2), (box_y / 2) - (toothpaste_y + (picks_paste_gap / 2)), 0
    ])
    {
        linear_extrude(height = z)
        {
            square(
                [
                    picks_width + thickness,
                    picks_paste_gap,
                ],
                center = true);
        };
    }

    // Floss Pick Oval
    translate(v = [ -(box_x / 2) + toothbrush_width + (thickness / 2), -(picks_paste_gap + (picks_y / 2)), 0 ])
        linear_extrude(height = z)
    {
        difference()
        {
            offset(thickness) scale([ 1, 2.6 ]) circle(d = 10 - thickness);
            scale([ 1, 2.6 ]) circle(d = 10 - thickness);
        }
    }

    // OUTER BOX

    linear_extrude(height = z)
    {
        difference()
        {
            offset(thickness) square([ box_x, box_y ], center = true);
            square([ box_x, box_y ], center = true);
        }
    }
}