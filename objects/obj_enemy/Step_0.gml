var _castle = instance_find(obj_castle, 0);
if(instance_position(x, y, obj_castle)){
	with (obj_castle) hp -= 10;
	instance_destroy();
}

var _target = current_target();
if (_target == undefined){
	speed = 0;
	return;
} 

var _map_controller = instance_find(obj_map_controller, 0);
var _tile = _map_controller.get_tile(_target.row, _target.col);
var _target_x = _tile.x;
var _target_y = _tile.y - (_tile.sprite_height / 4);
var _move_speed = 0.5;

if(point_distance(x, y, _target_x, _target_y) < 2){
	next_target();
} else {
	move_towards_point(_target_x, _target_y , _move_speed);
}
