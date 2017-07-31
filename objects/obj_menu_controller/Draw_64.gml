/// @description Draws title

draw_set_alpha(1 - global.alpha_);
draw_set_halign(fa_center);
draw_set_font(fnt_endless_64);
draw_text(room_width / 2, 64, "Fuck You");
draw_set_font(-1);
draw_set_halign(fa_left);
draw_set_alpha(1);