/// @description Debug variables

if debug_ {
	with (obj_player) {
		draw_text(10, 10, "Velocity:        [x: " + string(velocity_[h]) + ", y: " + string(velocity_[v]) + "]");
		draw_text(10, 30, "On Ground:       " + string(place_meeting(x, y + 1, obj_solid)));
		draw_text(10, 50, "Power:           " + string(power_));
		draw_text(10, 70, "Audio:           " + string(audio_is_playing(snd_fire_id_)));
	}
	draw_text(10, 90, "Collision Tiles: " + string(tiles_));
	draw_text(10, 110, "View 00:        " + string(camera_get_view_x(view_camera[0])) + ", " + string(camera_get_view_y(view_camera[0])));
}

draw_set_font(fnt_endless_64);
draw_set_halign(fa_center);
draw_text(view_wport[0] / 2, 20, "00:00");
draw_set_font(-1);
draw_set_halign(fa_left);
