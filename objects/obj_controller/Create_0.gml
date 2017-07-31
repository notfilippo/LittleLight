/// @description Creation of collidable layer, A* grid, shader, parallax layers

global.light_idx = 0;
global.lights = array_create(20 * 3, 0.0);

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
u_player_light_color_ = shader_get_uniform(shd_pixel_light, "player_light_color");
u_player_position_ = shader_get_uniform(shd_pixel_light, "player_position");
u_light_color_ = shader_get_uniform(shd_pixel_light, "light_color");
u_lights_ = shader_get_uniform(shd_pixel_light, "lights");
u_max_power_ = shader_get_uniform(shd_pixel_light, "max_power");
u_power_ = shader_get_uniform(shd_pixel_light, "power");

parallax_[0] = layer_get_id("Parallax1x");
parallax_x_[0] = 0.2;

parallax_[1] = layer_get_id("Parallax2x");
parallax_x_[1] = 0.4;

if gamepad_is_supported() {
	if gamepad_is_connected(0) gamepad_set_axis_deadzone(0, 0.32);
}