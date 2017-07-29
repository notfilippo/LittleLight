/// @description Movement

var xx = (keyboard_check(ord("D")) - keyboard_check(ord("A"))) * acceleration_;
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
	velocity_[h] = clamp(velocity_[h] + xx, -max_velocity_[h] * jab_power_, max_velocity_[h] * jab_power_);
}

if !place_meeting(x, y + 1, obj_solid) {
	// LET'S NEWTON
	velocity_[v] += gravity_;
	
	if sprite_index == spr_player_jump && image_index >= 1 {
		sprite_index = spr_player_in_air;
	}
	
	moving = true;
	
} else {
	if keyboard_check_pressed(vk_space) {
		sprite_index = spr_player_jump;
		image_index = 0;
		moving = true;			
		velocity_[v] = -jump_speed_;
		jumping_ = true;
	} else if jumping_ && sprite_index == spr_player_land && image_index >= 2 {
		jumping_ = false;
		moving = false;
	} else if jumping_ && sprite_index == spr_player_land {
		moving = true;
	}else if jumping_ && sprite_index == spr_player_in_air {
		sprite_index = spr_player_land;
		image_index = 0;
		moving = true;
	}
}

if (!moving) {
	sprite_index = spr_player_idle;
}

power_ = (room_width - x) / room_width;
jab_power_ = max(power_, 0.4);
audio_sound_gain(snd_fire_id_, power_ / 4, 0);

move(velocity_, false);