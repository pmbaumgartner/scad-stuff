$fn = 100;

outerd = 8.25;
inner = 3.83;
tall = 2.6;

linear_extrude(height = tall) difference()
{
    circle(outerd / 2);
    circle(inner / 2);
}