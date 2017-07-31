///@param tile_idx
var tile_idx = argument0;
var w2 = sprite_width / 2;
var h2 = sprite_height / 2;

with obj_autotile {
	
	var tile_score = tile_idx;

	if (place_meeting(x,      y - 17, obj_autotile)) tile_score += 1;
	if (place_meeting(x + 17, y,      obj_autotile)) tile_score += 2;
	if (place_meeting(x,      y + 17, obj_autotile)) tile_score += 4;
	if (place_meeting(x - 17, y,      obj_autotile)) tile_score += 8;
	
	if tile_score - tile_idx == 15 {
		if (!place_meeting(x + w2 + 32, y + h2 + 32, obj_autotile)) tile_score += 1;
		if (!place_meeting(x - w2 - 32, y + h2 + 32, obj_autotile)) tile_score += 2;
		if (!place_meeting(x + w2 + 32, y - h2 - 32, obj_autotile)) tile_score += 3;
		if (!place_meeting(x - w2 - 32, y - h2 - 32, obj_autotile)) tile_score += 4;
	}
	
	if tile_score - tile_idx == 15 && random(1) > 0.92 {
		tile_score = irandom_range(48, 50);
	}
			
	var tile_data = tilemap_get(obj_generator.tilemap_, x / 32, y / 32);
	tile_data = tile_set_index(tile_data, tile_score);
	tilemap_set(obj_generator.tilemap_, tile_data, x / 32, y / 32);
	
	if tile_idx == 25 && tile_score == 36 && random(1) > 0.80 {
		var i = irandom_range(56, 58);
		tile_data = tile_set_index(tile_data, i);
		tilemap_set(obj_generator.tilemap_, tile_data, x / 32, y / 32);
		tile_data = tilemap_get(obj_generator.tilemap_, x / 32, (y / 32) + 1);
		tile_data = tile_set_index(tile_data, i + 6);
		tilemap_set(obj_generator.tilemap_, tile_data, x / 32, (y / 32) + 1);
	}
	
	if tile_idx == 25 && tile_score == 39 && random(1) > 0.80 {
		var i = irandom_range(68, 70);
		tile_data = tile_set_index(tile_data, i);
		tilemap_set(obj_generator.tilemap_, tile_data, x / 32, y / 32);
		tile_data = tilemap_get(obj_generator.tilemap_, x / 32, (y / 32) - 1);
		tile_data = tile_set_index(tile_data, i + 6);
		tilemap_set(obj_generator.tilemap_, tile_data, x / 32, (y / 32) - 1);
	}
}