mm = 25.4;
card_width_in = 3;
card_height_in = 5;
card_width = card_width_in * mm;
card_height = card_height_in * mm;

width_buffer = 5; // mm on either side of card
height_buffer_in = 1;
height_buffer = height_buffer_in * mm;

full_width = card_width + (2 * width_buffer);
full_height = card_height + height_buffer;

// Card Holder Dimensions: 6.25" x 3.55" x 1.15"
// 3 x 5 cards
depth_z_in = 1.15;
depth_z = depth_z_in * mm;

holder_gap = 2.5;

round_radius = 5;

difference()
{
    linear_extrude(depth_z){
        offset(r = round_radius){square([ full_width - round_radius, full_height - round_radius ], center = true);
}
}
;
translate([ 0, ((height_buffer + round_radius) / 2), (depth_z * 0.15) ]){
    linear_extrude(height = depth_z){square([ card_width, card_height + round_radius ], center = true);
}
}
;
translate([ 0, (-(full_height + round_radius) / 2) + (height_buffer / 2), depth_z / (2 * .95) ])
{
    rotate(a = -10, v = [ 1, 0, 0 ])
    {
        linear_extrude(depth_z / 2)
        {
            square([ full_width + round_radius, holder_gap ], center = true);
        }
    }
}
}
;