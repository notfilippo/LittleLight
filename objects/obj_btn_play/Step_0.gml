/// @description Insert description here
// You can write your code in this editor

if mouse_check_button(mb_left) {
	image_index = 1;
} else if mouse_check_button_released(mb_left) {
	room_goto(rm_main);
} else {
	image_index = 0;
}