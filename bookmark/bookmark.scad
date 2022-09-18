height = 2;
length = 100;
width = 24;
inset = 3;
gap = 2;
emboss = 1;

union()
{
    linear_extrude(height)
    {
        union()
        {
            difference()
            {
                circle(r = width / 2);
                translate([ width / 2, 0 ])
                {
                    square([ width, width ], center = true);
                }
            };

            difference()
            {
                hull()
                {
                    circle(r = width / 2);
                    translate([ length, 0, 0 ])
                    {
                        circle(r = width / 2);
                    }
                };
                hull()
                {
                    circle(r = (width / 2) - inset);
                    translate([ length, 0, 0 ])
                    {
                        circle(r = (width / 2) - inset);
                    }
                };
            };
            hull()
            {
                circle(r = (width / 2) - (gap + inset));
                translate([ length, 0, 0 ])
                {
                    circle(r = (width / 2) - (gap + inset));
                }
            };
        }
    }
    linear_extrude(height + emboss)
    {
        text("UntitledBookClub.ipynb", size = 6, font = "Montserrat:style=Bold", valign = "center", spacing = 1);
    };
}