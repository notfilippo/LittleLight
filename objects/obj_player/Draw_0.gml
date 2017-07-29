/// @description Draw with glow

shader_set(shd_glow);
shader_set_uniform_f(u_glow_color_, 1.0, 0.3, 0.5)
shader_set_uniform_i(u_resolution_, room_width, room_height)
shader_set_uniform_f(u_direction_, 0.0, 0.0)
draw_self();
shader_reset();