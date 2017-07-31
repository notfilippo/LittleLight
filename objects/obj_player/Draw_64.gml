/// @description Draw power

draw_set_halign(fa_right);
draw_text(camera_get_view_width(view_camera[0]) - 10, 10, "Power: " + string(ceil(power_)))
draw_set_halign(fa_left);
