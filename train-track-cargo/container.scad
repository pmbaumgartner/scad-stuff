$fn = 60;

cont_length = 50;
cont_width = 20;
cont_height = 22.5;

cyl_diameter = 8;
cyl_height = 9.2;

magnet_diameter = 6;
magnet_height = 2;
magnet_d_tol = 0.75; // half on each side (d)
magnet_height_tol = 0.25;

top_cyl_diameter = 6;
top_cyl_height = cyl_height / 2;

dist_to_cyl_edge = 12;
dist_between_cyl = 10;

rounded_offset = 3;

assert(dist_to_cyl_edge + cyl_diameter + dist_between_cyl + cyl_diameter + dist_to_cyl_edge == cont_length);

difference()
{
    // container
    linear_extrude(height = cont_height) translate([ rounded_offset, rounded_offset, 0 ]) offset(rounded_offset)
        square([ cont_length - (rounded_offset * 2), cont_width - (rounded_offset * 2) ]);

    // bottom cylinders
    translate([ dist_to_cyl_edge + (cyl_diameter / 2), cont_width / 2, 0 ]) linear_extrude(height = cyl_height)
        circle(d = cyl_diameter);
    translate([ cont_length - (dist_to_cyl_edge + (cyl_diameter / 2)), cont_width / 2, 0 ])
        linear_extrude(height = cyl_height) circle(d = cyl_diameter);

    // top magnet
    translate([ cont_length / 2, cont_width / 2, cont_height ])
        translate([ 0, 0, -(magnet_height + magnet_height_tol) + 0.01 ])
            linear_extrude(height = magnet_height + magnet_height_tol) circle(d = magnet_diameter + magnet_d_tol);
    // bottom extra magnet
    translate([ cont_length / 2, cont_width / 2, 0 ]) linear_extrude(height = magnet_height + magnet_height_tol)
        translate([ 0, 0, -(magnet_height + magnet_height_tol) ]) circle(d = magnet_diameter + magnet_d_tol);
}

// // top magnet
// color("red") translate([ cont_length / 2, cont_width / 2, cont_height ])
//     translate([ 0, 0, -(magnet_height + magnet_height_tol) + 0.01 ])
//         linear_extrude(height = magnet_height + magnet_height_tol) circle(d = magnet_diameter + magnet_d_tol);