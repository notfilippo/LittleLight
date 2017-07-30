///@param frames
var frames = argument0;

if (frames = 0) {
	var height_limit = [2, 10];
	var height = 9;

	for (var xx = 0; xx < room_width / 2; xx = xx) {
		if random(1) > 0.20 {
			height = clamp(height - 0.5, height_limit[0], height_limit[1]);
		} else {
			height = clamp(height + 0.5, height_limit[0], height_limit[1]);
		}
		for (var tim = 0; tim < random_range(1, 3); tim++) {
			for (var yy = 0; yy < height * 32; yy += 32) {
				instance_create_layer(xx, yy, "Autotile", obj_autotile); 
			}
			xx += 32;
			if (xx >= room_width / 2) break;
		}
	}

	height = 9;

	for (var xx = room_width; xx >= room_width / 2; xx = xx) {
		if random(1) > 0.20 {
			height = clamp(height - 0.5, height_limit[0], height_limit[1]);
		} else {
			height = clamp(height + 0.5, height_limit[0], height_limit[1]);
		}
		for (var tim = 0; tim < random_range(1, 3); tim++) {
			for (var yy = 0; yy < height * 32; yy += 32) {
				instance_create_layer(xx, yy, "Autotile", obj_autotile); 
			}
			xx -= 32;
			if (xx < room_width / 2) break;
		}
	}
	
	autotile(25);
	
} else if (frames == 2) {

	with (obj_autotile) {
		instance_destroy();
	}
	
	layer_ = layer_get_id("Parallax1x");
	tilemap_ = layer_tilemap_get_id(layer_);
	
} else if frames == 4 {

	destroy_ = false;
	
	var height_limit = [2, 10];
	var height = 9;

	for (var xx = 0; xx < room_width / 2; xx = xx) {
		if random(1) > 0.20 {
			height = clamp(height - 0.5, height_limit[0], height_limit[1]);
		} else {
			height = clamp(height + 0.5, height_limit[0], height_limit[1]);
		}
		for (var tim = 0; tim < random_range(1, 3); tim++) {
			for (var yy = room_height; yy > room_height - height * 32; yy -= 32) {
				instance_create_layer(xx, yy, "Autotile", obj_autotile); 
			}
			xx += 32;
			if (xx >= room_width / 2) break;
		}
	}

	height = 9;

	for (var xx = room_width; xx >= room_width / 2; xx = xx) {
		if random(1) > 0.20 {
			height = clamp(height - 0.5, height_limit[0], height_limit[1]);
		} else {
			height = clamp(height + 0.5, height_limit[0], height_limit[1]);
		}
		for (var tim = 0; tim < random_range(1, 3); tim++) {
			for (var yy = room_height; yy > room_height - height * 32; yy -= 32) {
				instance_create_layer(xx, yy, "Autotile", obj_autotile); 
			}
			xx -= 32;
			if (xx < room_width / 2) break;
		}
	}
	
	autotile(25);

} else if frames >= 6 {

	with (obj_autotile) {
		instance_destroy();
	}
	
	instance_destroy();
}