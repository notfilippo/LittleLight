///@param speed
///@param bounce
var speed_ = argument0;
var bounce_ = argument1;

if place_meeting(x + speed_[h], y, obj_solid) {
	while !place_meeting(x + sign(speed_[h]), y, obj_solid) {
		x += sign(speed_[h]);
	}
	if bounce_ > 0 {
		speed_[@ h] = -speed_[@ h] * bounce_;
	} else {
		speed_[@ h] = 0;
	}
}

x += speed_[h];

if place_meeting(x, y + speed_[v], obj_solid) {
	while !place_meeting(x, y + sign(speed_[v]), obj_solid) {
		y += sign(speed_[v]);
	}
	if bounce_ > 0 {
		speed_[@ v] = -speed_[@ v] * bounce_;
	} else {
		speed_[@ v] = 0;
	}
}

y += speed_[v];