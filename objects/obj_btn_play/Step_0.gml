/// @description Insert description here
// You can write your code in this editor

if !instance_exists(obj_transition) {
	if mouse_check_button(mb_left) {
		image_index = 1;
	} else if mouse_check_button_released(mb_left) {
		instance_create_layer(0, 0, "Instances", obj_transition);
		image_index = 0;
	} else {
		image_index = 0;
	}
}