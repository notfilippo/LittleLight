/// @description Insert description here
// You can write your code in this editor

if debug_ {
	draw_set_alpha(0.3);
	draw_rectangle(obj_player.bbox_left, obj_player.bbox_bottom, obj_player.bbox_right, obj_player.bbox_top, true);
	draw_set_alpha(1);
}