/// @description Draw power

draw_set_alpha(0.5 - global.alpha_);
draw_sprite(spr_power_bar_l, 0, 10, 10);
draw_sprite_part(spr_power_bar, 0, 0, 0, power_ * sprite_get_width(spr_power_bar) / 100, sprite_get_height(spr_power_bar), 10 + sprite_get_width(spr_power_bar_l), 10);
draw_sprite(spr_power_bar_r, 0, 10 + sprite_get_width(spr_power_bar_l) + power_ * sprite_get_width(spr_power_bar) / 100, 10);
draw_set_alpha(1);