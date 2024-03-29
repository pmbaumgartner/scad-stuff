/* From http://www.thingiverse.com/thing:3457
   © 2010 whosawhatsis

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Lesser General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
   GNU Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public License
   along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

/*
This script generates a teardrop shape at the appropriate angle to prevent overhangs greater than 45 degrees. The angle
is in degrees, and is a rotation around the Y axis. You can then rotate around Z to point it in any direction. Rotation
around X or Y will cause the angle to be wrong.
*/

module teardrop(radius, length, angle)
{
    rotate([ 0, angle, 0 ]) union()
    {
        linear_extrude(height = length, center = true, convexity = radius, twist = 0) circle(r = radius, $fn = 100);
        linear_extrude(height = length, center = true, convexity = radius, twist = 0) projection(cut = false)
            rotate([ 0, -angle, 0 ]) translate([ 0, 0, radius * sin(45) * 1.5 ])
                cylinder(h = radius * sin(45), r1 = radius * sin(45), r2 = 0, center = true, $fn = 100);
    }

    // I worked this portion out when a bug was causing the projection above to take FOREVER to calculate. It works as a
    // replacement, and I figured I'd leave it here just in case.
    /*
        #polygon(points = [[radius * cos(-angle / 2), radius * sin(-angle / 2), 0],[radius * cos(-angle / 2), radius *
       -sin(-angle / 2), 0],[(sin(-angle - 45) + cos(-angle - 45)) * radius, 0, 0]], paths = [[0, 1, 2]]);
        #polygon(points = [[radius * -cos(-angle / 2), radius * sin(-angle / 2), 0],[radius * -cos(-angle / 2), radius *
       -sin(-angle / 2), 0],[(sin(-angle - 45) + cos(-angle - 45)) * radius, 0, 0]], paths = [[0, 1, 2]]);
        #polygon(points = [[radius * sin(-angle / 2), radius * cos(-angle / 2), 0],[radius * sin(-angle / 2), radius *
       -cos(-angle / 2), 0],[(sin(-angle - 45) + cos(-angle - 45)) * radius, 0, 0]], paths = [[0, 1, 2]]);
    */
}

/*
 * Simple intersection method to implement a flat/truncated teardrop
 */
module flat_teardrop(radius, length, angle)
{
    intersection()
    {
        rotate([ 0, angle, 0 ])
        {
            cube(size = [ radius * 2, radius * 2, length ], center = true);
        }
        teardrop(radius, length, angle);
    }
}

module test_teardrop()
{
    translate([ 0, -15, 0 ]) teardrop(5, 20, 90);
    translate([ 0, 0, 0 ]) teardrop(5, 20, 60);
    translate([ 0, 15, 0 ]) teardrop(5, 20, 45);
}

$fn = 100;

width = 4;
scaling = 1.88;
total_len = 125 + 22.6;
bottom_to_circle = 23;
difference()
{
    scale([ 1, 1, scaling ]) teardrop((total_len / 2) / scaling, width, 90);
    color("red") translate([ 0, 0, (total_len / 2) - bottom_to_circle ]) rotate([ 0, 90, 0 ])
        cylinder(h = width, r = 5.75 / 2, center = true);
    color("green") scale([ 1, 1.25, 1 ]) translate([ 0, 0, (total_len / 2) + bottom_to_circle ]) rotate([ 0, 90, 0 ])
        cylinder(h = width, r = 25, center = true);
}