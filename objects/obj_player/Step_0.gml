/// @description Movement & Checks

// MOVEMENT

var xx = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration_;
if gamepad_is_supported() && gamepad_is_connected(0) xx += gamepad_axis_value(0, gp_axislh) * acceleration_;
var moving = false;

if xx > 0 {
	if !jumping_ sprite_index = spr_player_walk;
	image_xscale = 1;
	moving = true;
} else if xx < 0 {
	if !jumping_ sprite_index = spr_player_walk;
	image_xscale = -1;
	moving = true;
}

if xx = 0 {
	// LET'S FRICTION
	velocity_[h] = lerp(velocity_[h], 0, .2); 
	
} else {
	// LET'S MOVE
	velocity_[h] = clamp(velocity_[h] + xx, -max_velocity_[h] * clamp(power_ / max_power_ + 0.5, 0.5, 1), max_velocity_[h] * clamp(power_ / max_power_ + 0.5, 0.5, 1));
	if !light_source_ power_ = clamp(power_ - 10 * dt, 0, max_power_);
}

if !place_meeting(x, y + 1, obj_solid) {
	// LET'S NEWTON
	velocity_[v] += gravity_;
	
	if jumping_ && !d_jumping_ && (keyboard_check_pressed(vk_space) || (gamepad_is_connected(0) && gamepad_button_check_pressed(0, gp_face1))) {
		sprite_index = spr_player_dubleJump;
		image_index = 0;
		moving = true;			
		velocity_[v] = -jump_speed_;
		d_jumping_ = true;
	}
	
	if sprite_index == spr_player_jump && image_index >= 1 {
		sprite_index = spr_player_in_air;
	}
	
	moving = true;
	
} else {
	
	if keyboard_check_pressed(vk_space) || (gamepad_is_connected(0) && gamepad_button_check(0, gp_face1) && !d_jumping_) {
		sprite_index = spr_player_jump;
		image_index = 0;
		moving = true;
		velocity_[v] = -jump_speed_;
		jumping_ = true;
	} else if sprite_index == spr_player_land {
		if image_index >= 2 sprite_index = spr_player_idle;
		moving = true;
	} else if jumping_ && (sprite_index == spr_player_in_air || sprite_index == spr_player_dubleJump) {
		sprite_index = spr_player_land;
		image_index = 0;
		moving = true;
		jumping_ = false;
		d_jumping_ = false;
	}
}

if (!moving) {
	sprite_index = spr_player_idle;
}

move(velocity_, false);

// CHECKS

if y > room_height + sprite_height {
	power_ -= 2;
	velocity_[h] = velocity_[v] = 0;
}

if distance_to_object(obj_fireplace) < 128 {
	light_source_ = true;
	power_ = clamp(power_ + (random_range(6, 16) * dt), 0, max_power_);
} else if distance_to_object(obj_torch) < 128 {
	light_source_ = true;
} else if distance_to_object(obj_endlevel) < 128 {
	light_source_ = true;
} else {
	light_source_ = false;
	power_ = clamp(power_ - (random_range(4, 2) * dt), 0, max_power_);
}

if power_ <= 0 {
	if !instance_exists(obj_reset) {
		instance_create_layer(0, 0, "Instances", obj_reset);
	}
}

audio_sound_gain(snd_fire_id_, clamp(power_ / max_power_ + 0.2, 0.2, 1), 0);