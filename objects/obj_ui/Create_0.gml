focused_tile = noone;

function set_focus(_tile) {
	if(focused_tile != _tile) clear_focus();
	focused_tile = _tile;
	
	with(focused_tile) hovered = true;
}

function clear_focus() {
	with(focused_tile) hovered = false;
	focused_tile = noone;
}

function can_place(_tile) {
	if (_tile == noone) return false;
	return _tile.tower == noone && _tile.sprite_index == spr_grass
}
