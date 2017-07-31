/// @description Parallax

#macro padding 512

global.light_idx = 0;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var cw = camera_get_view_width(view_camera[0]);
var ch = camera_get_view_height(view_camera[0]);

for (var i = 0; i < array_length_1d(parallax_); i++) {
	layer_x(parallax_[i], parallax_x_[i] * cx);
}

with obj_fireplace {
	if bbox_right + padding > cx
	&& bbox_left - padding < cx + cw
	&& bbox_bottom + padding > cy
	&& bbox_top - padding < cy + ch {
	
		global.lights[global.light_idx]     = x - cx + sprite_width / 2;
		global.lights[global.light_idx + 1] = y - cy + sprite_height / 2;
		global.lights[global.light_idx + 2] = 1;
		global.light_idx += 3;
	}
}

with obj_torch {
	if bbox_right + padding > cx
	&& bbox_left - padding < cx + cw
	&& bbox_bottom + padding > cy
	&& bbox_top - padding < cy + ch {
	
		global.lights[global.light_idx]     = x - cx + 7;
		global.lights[global.light_idx + 1] = y - cy + 30;
		global.lights[global.light_idx + 2] = 1;
		global.light_idx += 3;
	}
}