$fn = 60;
use </Users/peter/projects/py-open-scad/common/roundedrectdiff.scad>

grinder_diameter = 48.1;
grinder_bottom_height = 94;

handle_height = 148;
handle_width = 36;
handle_depth = 11;

base_height = 10;
base_buffer = 4;

inner_tolerance = 1;
outer_expansion = 4.5;

z_offset = 7; // Down from base

// Derived Variables
height = round(handle_height / 3) + 1; // 49.3 is 1/3rd, we'll round to 50
handle_base_size = handle_width + base_buffer;

width_pos = ((grinder_diameter+inner_tolerance)/2) + (outer_expansion);
height_pos = ((grinder_diameter + inner_tolerance)/ 2) + (outer_expansion*2) + ((handle_depth + inner_tolerance));
height_neg = ((grinder_diameter+inner_tolerance)/2) + outer_expansion;
// color("red") translate([0,height_pos,0]){cylinder(r=2, h=100);}
// color("red") translate([0,-height_neg,0]){cylinder(r=2, h=100);}
// color("red") translate([width_pos,0,0]){cylinder(r=2, h=100);}
// color("red") translate([-width_pos,0,0]){cylinder(r=2, h=100);}

union()
{
    // base
    difference() {
    hull() {
        translate([width_pos+base_buffer, height_pos+base_buffer]){cylinder(h=base_height, r=5);}
        translate([width_pos+base_buffer, -(height_neg+base_buffer)]){cylinder(h=base_height, r=5);}
        translate([-(width_pos+base_buffer), height_pos+base_buffer]){cylinder(h=base_height, r=5);}
        translate([-(width_pos+base_buffer), -(height_neg+base_buffer)]){cylinder(h=base_height, r=5);}

    }
    translate(
        [ 0, ((grinder_diameter + inner_tolerance)/ 2) + outer_expansion + ((handle_depth + inner_tolerance) / 2), base_height - z_offset ])
    {        
        linear_extrude(height) {
            square([ handle_width + inner_tolerance, handle_depth + inner_tolerance ], center = true);
        }
    }
    translate([ 0, 0, base_height - z_offset])
    {
        linear_extrude(height)
        {
            circle(d = (grinder_diameter + inner_tolerance) );
        }
    }
    }
    // handle holder
    translate(
        [ 0, ((grinder_diameter + inner_tolerance)/ 2) + outer_expansion + ((handle_depth + inner_tolerance) / 2), base_height ])
    {
        linear_extrude(height)
        {
            {
                difference()
                {
                    offset(outer_expansion)
                    {
                        square([ handle_width + inner_tolerance, handle_depth + inner_tolerance ], center = true);
                    }
                    {
                        square([ handle_width + inner_tolerance, handle_depth + inner_tolerance ], center = true);
                    }
                }
            }
        }
    }
    // cylinder
    difference(){
    translate([ 0, 0, base_height ])
    {
        linear_extrude(height)
        {
            {
                difference()
                {
                    offset(outer_expansion)
                    {
                        circle(d = (grinder_diameter + inner_tolerance) );
                    }
                    {
                        circle(d = (grinder_diameter + inner_tolerance) );
                    }
                }
            }
        }
    }
    translate(v = [(grinder_diameter/2)+inner_tolerance-(outer_expansion*2), 0, (height+base_height) / 2]) {
				rotate(a = [90, 270, 90]) {
					linear_extrude(height = outer_expansion*4) {
						rounded_subtraction_square_top(height = height + base_height, radius = 6, width = handle_depth + inner_tolerance + outer_expansion);
					}
				}
			}
    translate(v = [0, -((grinder_diameter/2)+(inner_tolerance)+outer_expansion), (height+base_height) / 2]) {
				rotate(a = [180, 270, 90]) {
					linear_extrude(height = outer_expansion*4) {
						rounded_subtraction_square_top(height = height + base_height, radius = 6, width = handle_depth + inner_tolerance + outer_expansion);
					}
				}
			}
    translate(v = [-((grinder_diameter/2)+(inner_tolerance)+outer_expansion), 0, (height+base_height) / 2]) {
				rotate(a = [90, 270, 90]) {
					linear_extrude(height = outer_expansion*4) {
						rounded_subtraction_square_top(height = height + base_height, radius = 6, width = handle_depth + inner_tolerance + outer_expansion);
					}
				}
			}
    }
}
