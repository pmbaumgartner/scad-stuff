$fn = 60;

outer_diameter = 19.75;
thickness = 1;
lip_thickness = 0.35;
full_height = 20;
height = 16;

inner_lip_diameter = outer_diameter - thickness - lip_thickness;
echo(inner_lip_diameter);
inner_lip_bottom = 1.75;
inner_lip_top = 2.45;

nozzle_height = 6;
nozzle_width = 4; // diameter

inner_diameter = outer_diameter - thickness;
inner_lip_height = inner_lip_top - inner_lip_bottom;
cylinder_height = height - thickness; // So we can put a "disc" on the top

cap_diameter = 17.75;    // Diameter of the inside of the glue stick that the cap fits over
cap_large_diameter = 18; // Inside Glue stick diameter at widest point
tolerance_upper = 0.25;  // Tolerance for new cap
cap_cyl_height = 4;

nozzle_slope = ((outer_diameter / 2) - (nozzle_width / 2)) / nozzle_height;
nozzle_is_cap_diameter = nozzle_height - (((outer_diameter / 2) - (nozzle_width / 2)) / nozzle_slope);

union()
{
    // Outer cylinder
    difference()
    {
        cylinder(h = cylinder_height, r = outer_diameter / 2, center = false);
        cylinder(h = cylinder_height, r = inner_diameter / 2, center = false);
    }

    // top
    difference()
    {
        color("red") difference()
        {
            translate([ 0, 0, cylinder_height ])
                cylinder(h = thickness + nozzle_height, r1 = outer_diameter / 2, r2 = nozzle_width / 2, center = false);
            translate([ 0, 0, (cylinder_height) - (thickness) ]) cylinder(
                h = thickness + nozzle_height, r1 = (outer_diameter / 2), r2 = nozzle_width / 2, center = false);
        }
        cylinder(h = cylinder_height * 2, r = nozzle_width / 2);
    }
    // lip
    color("green") translate([ 0, 0, inner_lip_bottom ]) difference()
    {
        cylinder(h = inner_lip_height, r = inner_diameter / 2, center = false);
        cylinder(h = inner_lip_height, r = inner_lip_diameter / 2, center = false);
    }

    // lip cap holder
    difference()
    {
        union()
        {
            translate([ 0, 0, cylinder_height + nozzle_is_cap_diameter ])
                cylinder(h = cap_cyl_height, r = (cap_diameter / 2) + (tolerance_upper / 2), center = false);
            translate([ 0, 0, cylinder_height + nozzle_is_cap_diameter + cap_cyl_height - inner_lip_height ])
                cylinder(h = inner_lip_height, r = (cap_large_diameter / 2) + (tolerance_upper / 2), center = false);
        }
        translate([ 0, 0, cylinder_height ])
            cylinder(h = thickness + nozzle_height, r1 = outer_diameter / 2, r2 = nozzle_width / 2, center = false);
    }

    // base
    color("green") translate([ 0, 0, 0 ]) difference()
    {
        cylinder(h = inner_lip_top, r1 = (outer_diameter / 2) + 3, r2 = (outer_diameter / 2), center = false);
        cylinder(h = inner_lip_top, r = (inner_diameter / 2), center = false);
    }
}