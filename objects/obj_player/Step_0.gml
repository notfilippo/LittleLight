/// @description Movement

var xx = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration_;


if xx = 0 {
	// LET'S FRICTION
	velocity_[h] = lerp(velocity_[h], 0, .2); 
} else {
	// LET'S MOVE
	velocity_[h] = clamp(velocity_[h] + xx, -max_velocity_[h], max_velocity_[h]);
}

if !place_meeting(x, y + 1, obj_solid) {
	// LET'S NEWTON
	velocity_[v] += gravity_;
} else {
	if keyboard_check_pressed(vk_space) {
		velocity_[v] = -jump_speed_;
	}
}

move(velocity_, false);