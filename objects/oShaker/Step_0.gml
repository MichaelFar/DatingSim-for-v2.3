/// @description Insert description here
// You can write your code in this editor

	view_x = camera_get_view_x(view_camera[0]);
	view_y = camera_get_view_y(view_camera[0]);
	var ran_x = random_range(-shake_strength, shake_strength);
	var ran_y = random_range(-shake_strength, shake_strength);
	camera_set_view_pos(view_camera[0], view_x + ran_x, view_y + ran_y);
	
