/// @description Insert description here
// You can write your code in this editor

shader_set(shd_pixel_light);
shader_set_uniform_f(u_time_, current_time);
shader_set_uniform_f(u_resolution_,  view_wport[0], view_hport[0]);
shader_set_uniform_f(u_player_light_color_, 255, 164, 4);
shader_set_uniform_f(u_player_position_,
	obj_player.x - camera_get_view_x(view_camera[0]),
	obj_player.y - camera_get_view_y(view_camera[0]) - obj_player.sprite_height / 2
);
shader_set_uniform_f(u_light_color_, 255, 164, 4);
shader_set_uniform_f_array(u_lights_, global.lights);
shader_set_uniform_f(u_max_power_, obj_player.max_power_);
shader_set_uniform_f(u_power_, obj_player.power_);
surface_resize(application_surface,  view_wport[0], view_hport[0])
draw_surface(application_surface, view_xport[0], view_yport[0]);
shader_reset();
global.lights = array_create(20 * 3, 0);
global.light_idx = 0;
