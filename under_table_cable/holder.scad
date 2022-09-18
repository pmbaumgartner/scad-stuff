length = 45;
depth = 22;
gap = 12;

line_width = 0.4 * 8;

z_width = 26;

module hook (length, depth, gap, line_width, z_width) {
linear_extrude(z_width) {
union() {
    // top
square([length, line_width]);
translate([length, 0,0 ])  square([line_width, depth]);
translate([0, depth,0 ])  square([length+line_width, line_width]);
translate([0, gap+line_width, 0]) square([line_width, depth-gap]);
}
};
}


union() {
hook(length, depth, gap, line_width, z_width);
rotate([0, 180, 0]) translate([-length*2,0,-z_width]) hook(length, depth, gap, line_width, z_width);
}

// translate([0,depth,0]) {
// union() {
// hook(length, depth, gap, line_width, z_width);
// rotate([0, 180, 0]) translate([-length*2,0,-z_width]) hook(length, depth, gap, line_width, z_width);

// }}




// 
module hookdiag (length, depth, gap, line_width, z_width) {
difference() {
linear_extrude(z_width) {
union() {
    // top
square([length, line_width]);
translate([length, 0,0 ])  square([line_width, depth]);
translate([0, depth,0 ])  square([length+line_width, line_width]);
translate([0, gap+line_width, 0]) square([line_width, depth-gap]);
}
};
for (i = [-line_width*5 : ceil(line_width * 2): ceil(length*2)]) {
    translate([0, line_width+depth, 0]) intersection() {
    rotate([90, 0, 0]) linear_extrude(line_width*2) offset(-line_width) {square([length, z_width]);}
    translate([i, 0, 0]) rotate([90, 30, 0]) linear_extrude(line_width*2)  square([line_width, z_width*2]);
    }};
};
}