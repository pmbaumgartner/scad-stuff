$fn = 60;

outer_diameter = 19.75;
thickness = 1;
lip_thickness = 0.25;
height = 20;

inner_lip_diameter = outer_diameter - thickness - lip_thickness;
inner_lip_bottom = 1.75;
inner_lip_top = 2.45;

nozzle_height = 8;
noddle_width = 2;

inner_diameter = outer_diameter - thickness;
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
    difference()
    {
        color("red") difference()
        {
            translate([ 0, 0, cylinder_height / 2 ])
                cylinder(h = thickness + nozzle_height, r1 = outer_diameter / 2, r2 = noddle_width, center = false);
            translate([ 0, 0, (cylinder_height / 2) - (thickness / 2) ])
                cylinder(h = thickness + nozzle_height, r1 = (outer_diameter / 2), r2 = noddle_width, center = false);
        }
        cylinder(h = cylinder_height * 2, r = 2);
    }
    // lip
    color("green") translate([ 0, 0, (-(cylinder_height) / 2) + inner_lip_bottom ]) difference()
    {
        cylinder(h = inner_lip_height, r = inner_diameter / 2, center = true);
        cylinder(h = inner_lip_height, r = inner_lip_diameter / 2, center = true);
    }

    // base
    color("green") translate([ 0, 0, -(cylinder_height / 2) ]) difference()
    {
        cylinder(h = inner_lip_top, r = (outer_diameter / 2) + 3, center = false);
        cylinder(h = inner_lip_top, r = (inner_diameter / 2), center = false);
    }
}