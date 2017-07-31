/// @description Debug variables

if debug_ {
	with obj_player {
		draw_text(10, 10, "Velocity:        [x: " + string(velocity_[h]) + ", y: " + string(velocity_[v]) + "]");
		draw_text(10, 30, "On Ground:       " + string(place_meeting(x, y + 1, obj_solid)));
		draw_text(10, 50, "Gravity:         " + string(gravity_));
		draw_text(10, 70, "Jump:            " + string(jumping_));
		draw_text(10, 90, "Djump:           " + string(d_jumping_));
	}
	draw_text(10, 110, "Collision Tiles: " + string(tiles_));
	draw_text(10, 130, "View 00:         " + string(camera_get_view_x(view_camera[0])) + ", " + string(camera_get_view_y(view_camera[0])));
	draw_text(10, 150, "Instances:       " + string(instance_count - tiles_) + " (" + string(instance_count) + ")");
}
