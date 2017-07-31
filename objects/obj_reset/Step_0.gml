/// @description Insert description here
// You can write your code in this editor

if global.alpha_ >= 1 {
	add_ = false;
	room_restart();
} else if global.alpha_ <= 0 && !add_ {
	instance_destroy();
}

global.alpha_ += 3 * delta_time / 1000000 * (add_ ? 1 : -1);