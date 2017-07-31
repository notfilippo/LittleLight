/// @description Draw with shader

shader_set(shd_extinguish);
shader_set_uniform_f(u_max_power_, max_power_);
shader_set_uniform_f(u_power_, power_);
shader_set_uniform_i(u_invert_, false);
draw_self();
shader_reset();
