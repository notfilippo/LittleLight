/// @description Debug Variables

var basic = string_height("Vv:[]") + 12;

draw_text(10, 10, "Velocity: [" + string(velocity_[h]) + ", " + string(velocity_[v]) + "]");
draw_text(10, basic, "On Ground: " + string(place_meeting(x, y + 1, obj_solid)));
