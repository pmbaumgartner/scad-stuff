// Generated by SolidPython 1.1.3 on 2022-08-23 20:12:20
use </Users/peter/projects/py-open-scad/cupholder/../common/roundedrectdiff.scad>


union() {
	difference() {
		cylinder($fn = 60, h = 43, r = 34.5000000000);
		cylinder($fn = 60, h = 43, r = 31.3000000000);
	}
	translate(v = [0, 0, 43]) {
		cylinder($fn = 60, h = 5, r = 48.7000000000);
	}
	difference() {
		translate(v = [0, 0, 48]) {
			difference() {
				cylinder($fn = 60, h = 58.0000000000, r = 48.7000000000);
				cylinder($fn = 60, h = 58.0000000000, r = 45.5000000000);
			}
		}
		color(alpha = 1.0000000000, c = "red") {
			translate(v = [41.3000000000, 0, 77.0000000000]) {
				rotate(a = [90, 270, 90]) {
					linear_extrude(height = 9.6000000000) {
						rounded_subtraction_square_top(height = 58.0000000000, radius = 5, width = 20);
					}
				}
			}
		}
	}
}