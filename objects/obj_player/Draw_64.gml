/// @description Debug Variables

draw_text(10, 10, "Velocity:  [x: " + string(velocity_[h]) + ", y: " + string(velocity_[v]) + "]");
draw_text(10, 30, "On Ground: " + string(place_meeting(x, y + 1, obj_solid)));
draw_text(10, 50, "Power:     " + string(power_));
draw_text(10, 70, "Audio:     " + string(audio_is_playing(snd_fire_id_)));

