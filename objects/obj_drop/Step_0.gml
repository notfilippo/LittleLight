/// @description Movement

var moving = false;

if !place_meeting(x - 32, y + 1, obj_solid) && image_xscale == -1 {
	sprite_index = spr_enemy_walk;
	image_xscale = 1;
	moving = true;
} else if !place_meeting(x + 32, y + 1, obj_solid) && image_xscale == 1 {
	sprite_index = spr_enemy_walk;
	image_xscale = -1;
	velocity_[h] = 0;
}

var xx = image_xscale * acceleration_;

if xx = 0 {
	// LET'S FRICTION
	velocity_[h] = lerp(velocity_[h], 0, 0.2); 
} else {
	// LET'S MOVE
	velocity_[h] = clamp(velocity_[h] + xx, -max_velocity_[h], max_velocity_[h]);
	moving = true;
}

if !place_meeting(x, y + 1, obj_solid) {
	// LET'S NEWTON
	velocity_[v] += gravity_;
}

sprite_index = moving ? spr_enemy_walk : spr_enemy_stand;

move(velocity_, false);