/// @description Insert description here
// You can write your code in this editor

if debug_ {
	draw_set_alpha(0.3);
	
	with (obj_player) {
		draw_bbox();
	}
	
	with (obj_drop) {
		draw_bbox();
	}
	
	draw_set_alpha(1);
}