///@param sprite_idx
var sprite_idx = argument0;
var w2 = sprite_width / 2;
var h2 = sprite_height / 2;

with (obj_autotile) {
	
	var tile_score = sprite_idx;

	if(place_meeting(x,      y - 17, obj_autotile)) tile_score += 1;
	if(place_meeting(x + 17, y,      obj_autotile)) tile_score += 2;
	if(place_meeting(x,      y + 17, obj_autotile)) tile_score += 4;
	if(place_meeting(x - 17, y,      obj_autotile)) tile_score += 8;
	
	if (tile_score - sprite_idx == 15) {
		if (!place_meeting(x + w2 + 32, y + h2 + 32, obj_autotile)) tile_score += 1;
		if (!place_meeting(x - w2 - 32, y + h2 + 32, obj_autotile)) tile_score += 2;
		if (!place_meeting(x + w2 + 32, y - h2 - 32, obj_autotile)) tile_score += 3;
		if (!place_meeting(x - w2 - 32, y - h2 - 32, obj_autotile)) tile_score += 4;
	}
			
	var tile_data_ = tilemap_get(obj_generator.tilemap_, x / 32, y / 32);
	tile_data_ = tile_set_index(tile_data_, tile_score);
	tilemap_set(obj_generator.tilemap_, tile_data_, x / 32, y / 32);
}