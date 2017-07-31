/// @description Variables

velocity_ = [0, 0];
max_velocity_ = [16, 16];
gravity_ = 0.75;
acceleration_ = 1.5;
jump_speed_ = 14;
jumping_ = false;
d_jumping_ = false;

max_power_ = 100;
power_ = max_power_;
light_source_ = false;

snd_fire_id_ = audio_play_sound(snd_fire, 1, true);

u_max_power_ = shader_get_uniform(shd_extinguish, "max_power");
u_power_ = shader_get_uniform(shd_extinguish, "power");
u_invert_ = shader_get_uniform(shd_extinguish, "invert");