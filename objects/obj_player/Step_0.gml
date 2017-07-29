/// @description Movement

var xx = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration_;

if xx > 0 {
	image_speed = 1;
	image_xscale = 1;
} else if xx < 0 {
	image_speed = 1;
	image_xscale = -1;
} else {
	image_speed = 0;
	image_index = 4;
}

if xx = 0 {
	// LET'S FRICTION
	velocity_[h] = lerp(velocity_[h], 0, .2); 
} else {
	// LET'S MOVE
	velocity_[h] = clamp(velocity_[h] + xx, -max_velocity_[h] * jab_power_, max_velocity_[h] * jab_power_);
}

if !place_meeting(x, y + 1, obj_solid) {
	// LET'S NEWTON
	velocity_[v] += gravity_;
} else {
	if keyboard_check_pressed(vk_space) {
		velocity_[v] = -jump_speed_;
	}
}

power_ = (room_width - x) / room_width;
jab_power_ = max(power_, 0.4);
audio_sound_gain(snd_fire_id_, power_ / 4, 0);

move(velocity_, false);