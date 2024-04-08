var _tile = instance_position(mouse_x, mouse_y, obj_tile);

if(can_place(_tile)){
	set_focus(_tile);
} else {
	clear_focus();
}

if(mouse_check_button_pressed(mb_left) && focused_tile && focused_tile.sprite_index == spr_grass){
	with (focused_tile) {
		tower = instance_create_depth(x,y, depth, obj_tower, {sprite_index:spr_tower_fire})
	}
}