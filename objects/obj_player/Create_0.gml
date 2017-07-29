/// @description Variables

velocity_ = [0, 0];
max_velocity_ = [4, 16];
gravity_ = 0.75;
jump_speed_ = 14;
acceleration_ = 1.1;
power_ = 0;

snd_fire_id_ = audio_play_sound(snd_fire, 1, true);

u_glow_color_ = shader_get_uniform(shd_glow, "glowColor");
u_resolution_ = shader_get_uniform(shd_glow, "resolution");
u_direction_ = shader_get_uniform(shd_glow, "direction");