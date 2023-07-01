$fn = 60;

outer_diameter = 19.75;
inner_diameter = 18.35;
height = 20;

inner_lip_diameter = 18.00;
inner_lip_bottom = 1.75;
inner_lip_top = 2.45;

thickness = outer_diameter - inner_diameter;
inner_lip_height = inner_lip_top - inner_lip_bottom;
cylinder_height = height - thickness; // So we can put a "disc" on the top

union()
{
    // Outer cylinder
    difference()
    {
        cylinder(h = cylinder_height, r = outer_diameter / 2, center = true);
        cylinder(h = cylinder_height, r = inner_diameter / 2, center = true);
    }

    // top
    color("red") translate([ 0, 0, cylinder_height / 2 ])
        cylinder(h = thickness, r = outer_diameter / 2, center = false);

    // lip
    color("green") translate([ 0, 0, (-(cylinder_height) / 2) + inner_lip_bottom ]) difference()
    {
        cylinder(h = inner_lip_height, r = inner_diameter / 2, center = true);
        cylinder(h = inner_lip_height, r = inner_lip_diameter / 2, center = true);
    }
}