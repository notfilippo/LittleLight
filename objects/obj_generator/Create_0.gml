/// @description Generate world

randomize();

generate_ = false;
destroy_ = false;
layer_ = layer_get_id("Parallax2x");
tilemap_ = layer_tilemap_get_id(layer_);
frames_ = 0;