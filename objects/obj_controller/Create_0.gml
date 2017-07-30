/// @description Insert description here
// You can write your code in this editor

tiles_ = 0;
debug_ = false;
collision_layer_ = layer_get_id("Collisions");

var tilemap = layer_tilemap_get_id(layer_get_id("Level"));

for (var yy = 0; yy < tilemap_get_height(tilemap); yy += 1) {
	for (var xx = 0; xx < tilemap_get_width(tilemap); xx += 1) {
		var data = tilemap_get(tilemap, xx, yy);
		if !tile_get_empty(data) {
			tiles_++;
			instance_create_layer(xx * 32, yy * 32, "Collisions", obj_solid);
		}
	}
}

application_surface_draw_enable(false);

u_time_ = shader_get_uniform(shd_pixel_light, "time");
u_resolution_ = shader_get_uniform(shd_pixel_light, "resolution");
u_vignette_settings_ = shader_get_uniform(shd_pixel_light, "vignette_settings");
u_vignette_color_ = shader_get_uniform(shd_pixel_light, "vignette_color");
u_player_light_color_ = shader_get_uniform(shd_pixel_light, "player_light_color");
u_player_position_ = shader_get_uniform(shd_pixel_light, "player_position");

parallax_[0] = layer_get_id("Parallax1x");
parallax_x_[0] = 0.2;

parallax_[1] = layer_get_id("Parallax2x");
parallax_x_[1] = 0.4;
