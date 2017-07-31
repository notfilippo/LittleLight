/// @description Movement

if distance_to_object(obj_player) < 300 {
	state_ = state.attacking;
} else {
	state_ = state.patrolling;
}

var xx = 0;
var moving = false;

if state_ == state.patrolling {

	max_velocity_ = [2, 2];

	sprite_index = spr_enemy_walk;

	if !place_meeting(x - 32, y + 1, obj_solid) && image_xscale == -1 {
		image_xscale = 1;
		velocity_[h] = 0;
	} else if !place_meeting(x + 32, y + 1, obj_solid) && image_xscale == 1 {
		image_xscale = -1;
		velocity_[h] = 0;
	} else if place_meeting(x - 32, y, obj_solid) && image_xscale == -1 {
		image_xscale = 1;
		velocity_[h] = 0;
	} else if place_meeting(x + 32, y, obj_solid) && image_xscale == 1 {
		image_xscale = -1;
		velocity_[h] = 0;
	}

} else if state_ = state.attacking {

	max_velocity_ = [5.5, 10];

	sprite_index = spr_enemy_walk;
	
	if x < obj_player.x + 32 {
		image_xscale = 1;
	} else if x > obj_player.x - 32 {
		image_xscale = -1;
	}
	
	xx += image_xscale;
	
	if !jumping_ {
	
		if !place_meeting(x - 16, y + 1, obj_solid) && image_xscale == -1 {
			if y >= obj_player.y {
				velocity_[v] = -jump_speed_;
				jumping_ = true;
				xx = -max_velocity_[h];
			}
		} else if !place_meeting(x + 16, y + 1, obj_solid) && image_xscale == 1 {
			if y >= obj_player.y {
				velocity_[v] = -jump_speed_;
				jumping_ = true;
				xx = max_velocity_[h];
			}
		} else if place_meeting(x - 32, y, obj_solid) && image_xscale == -1 {
			if y >= obj_player.y {
				velocity_[v] = -jump_speed_;
				jumping_ = true;
				xx = max_velocity_[h];
			}
		} else if place_meeting(x + 32, y, obj_solid) && image_xscale == 1 {
			if y >= obj_player.y {
				velocity_[v] = -jump_speed_;
				jumping_ = true;
				xx = max_velocity_[h];
			}
		}
	}
}
	
xx += image_xscale * acceleration_;	

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
} else {
	jumping_ = false;
}

sprite_index = moving ? spr_enemy_walk : spr_enemy_stand;

move(velocity_, false);