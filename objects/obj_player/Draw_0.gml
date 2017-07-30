/// @description Light
// You can write your code in this editor

shader_set(shd_power_red);
shader_set_uniform_f(u_power_, jab_power_);
draw_self();
shader_reset();