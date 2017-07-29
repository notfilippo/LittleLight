/// @description Insert description here
// You can write your code in this editor

shader_set(shd_pixel_light);
shader_set_uniform_f(u_time_, current_time);
shader_set_uniform_f(u_resolution_,  view_wport[0], view_hport[0]);
shader_set_uniform_f(u_vignette_settings_, 1.8, 2.1); //vignette inner circle size, vignette outter circle size
shader_set_uniform_f(u_vignette_color_, 245, 223, 201); //R,G,B - 0 to 255
shader_set_uniform_f(u_player_light_color_, 255, 164, 4);
shader_set_uniform_f(u_player_position_,
	obj_player.x - camera_get_view_x(view_camera[0]),
	obj_player.y - camera_get_view_y(view_camera[0]) - obj_player.sprite_height / 2
);
draw_surface(application_surface, 0, 0);
shader_reset();
