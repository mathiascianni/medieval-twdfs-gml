var _camera = view_camera[0];

if(mouse_check_button_pressed(mb_left)){
	anchor_x = mouse_x;
	anchor_y = mouse_y;
}

if(mouse_check_button(mb_left)){
	var _xdelta = mouse_x - anchor_x;
	var _ydelta = mouse_y - anchor_y;
	
	camera_set_view_pos(
		_camera,
		camera_get_view_x(_camera) - _xdelta,
		camera_get_view_y(_camera) - _ydelta
	)
}

if(keyboard_check_pressed(ord("R"))){
	camera_set_view_pos(
		_camera,
		0,
		0
	)
}

var _zoom_scale = 0.04;

if(mouse_wheel_up()){
	camera_set_view_size(
		_camera,
		camera_get_view_width(_camera) * (1 - _zoom_scale),
		camera_get_view_height(_camera) * (1 - _zoom_scale)
	)	
}

if(mouse_wheel_down()){
	camera_set_view_size(
		_camera,
		camera_get_view_width(_camera) * (1 + _zoom_scale),
		camera_get_view_height(_camera) * (1 + _zoom_scale)
	)	
}