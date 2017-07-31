/// @description Switch room

if room != room_last {
	instance_create_layer(0, 0, "Instances", obj_transition);
}
