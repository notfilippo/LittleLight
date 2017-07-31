/// @description Insert description here
// You can write your code in this editor

if alpha_ >= 1 {
	add_ = false;
	room_goto_next();
} else if alpha_ <= 0 && !add_ {
	instance_destroy();
}

alpha_ += 1 * delta_time / 1000000 * (add_ ? 1 : -1);