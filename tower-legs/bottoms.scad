z = 12.14285714;

tol = 0.01;

x = 12.3;
y = 47;
thickness = 5;
bottomy = 44;

union() difference()
{
    linear_extrude(height = z)
    {
        offset(thickness) square([ x + tol, y + tol ]);
        //         square([ x + tol, y + tol ]);
    }
    hull()
    {
        translate([ 0, 0, z ]) linear_extrude(0.0001) square([ x + tol, y + tol ]);
        linear_extrude(0.00001) square([ x + tol, bottomy + tol ]);
    };
}
translate([ 0, 0, -thickness ])
{
    linear_extrude(height = thickness)
    {
        union()
        {
            offset(thickness) square([ x + tol, y + tol ]);
            square([ x + tol, y + tol ]);
        }
    }
}

// color("red")
// {
//     hull()
//     {
//         translate([ 0, 0, z ]) linear_extrude(0.0001) square([ x + tol, y + tol ]);
//         linear_extrude(0.00001) square([ x + tol, bottomy + tol ]);
//     }
// }