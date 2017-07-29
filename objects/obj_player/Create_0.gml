/// @description Variables

velocity_ = [0, 0];
max_velocity_ = [16, 16];
gravity_ = 0.75;
jump_speed_ = 14;
acceleration_ = 1.1;
power_ = 0;
jab_power_ = 0;
jumping_ = false;

snd_fire_id_ = audio_play_sound(snd_fire, 1, true);

u_power_ = shader_get_uniform(shd_power_red, "power");