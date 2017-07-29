/// @description Parallax

for (var i = 0; i < array_length_1d(parallax_); i++) {
	layer_x(parallax_[i], parallax_x_[i] * camera_get_view_x(view_camera[0]));
}
