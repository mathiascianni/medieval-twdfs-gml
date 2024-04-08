TILE_INDEX = {
    tile_0: undefined,
    tile_1: spr_grass,
	tile_2: spr_grass_path_1,
	tile_3: spr_grass_path_2,
	tile_4: spr_grass_path_3,
	tile_5: spr_grass_path_4,
	tile_6: spr_grass_path_5,
	tile_7: spr_grass_path_6,
	tile_8: spr_grass_path_7,
}

tile_width	= 32;
tile_height	= 16;

castle_x = 14;
castle_y = 10;

tiles = [];

function draw_map() {
    var _tile_layout = make_map_layout();
	var _tile_xscale = 1;
	var _tile_yscale = 1;
	var _tile_width = tile_width;
	var _tile_height = tile_height;
	var _castle_position = {x: castle_x, y: castle_y}
	
    for (var _row = 0; _row < array_length(_tile_layout); _row++) {
        for (var _col = 0; _col < array_length(_tile_layout[_row]); _col++) {
			var _tile_index = "tile_" + string(_tile_layout[_row][_col]);
			var _tile_sprite = variable_struct_get(TILE_INDEX, _tile_index);
			
			if(_tile_sprite == undefined) continue;
			
			var _tile = instance_create_depth(
			200 + (_tile_width / 2 * _col),
			200 + (_tile_height / 2 * _row),
			-_row, 
			obj_tile,
			{
				sprite_index: _tile_sprite,
			})
			
			tiles[_row][_col] = _tile;
			
			if(_row == castle_x && _col == castle_y){
				with(_tile){
					tower = instance_create_depth(
						x,
						y,
						depth - 9999,
						obj_castle,
						{sprite_index: spr_castle_tower}
					)
				}	
			}
        }
    }
}


/**
	Generate a map layout from array
	Returns a 2D Array of integers where each number references a sprite_index
*/
function make_map_layout() {
    return [
		[0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0],
		[0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
		[0, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0],
		[0, 0, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0, 0],
		[0, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0, 0],
		[0, 0, 0, 1, 0, 5, 0, 1, 0, 1, 0, 1, 0],
		[0, 0, 1, 0, 6, 0, 1, 0, 1, 0, 1, 0, 1],
		[0, 0, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1, 0],
		[0, 0, 0, 0, 1, 0, 2, 0, 1, 0, 1, 0, 1],
		[0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0, 1, 0],
		[0, 0, 0, 0, 0, 0, 1, 0, 2, 0, 1, 0, 1],
		[0, 0, 0, 0, 0, 1, 0, 1, 0, 2, 0, 1, 0],
		[0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 5, 0, 1],
		[0, 0, 0, 0, 0, 1, 0, 1, 0, 6, 0, 1, 0],
		[0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0],
	];
}
	
function get_tile(_row, _col) {
	return tiles[_row][_col];
}
	
enemies_spawned = 0;
enemies_to_spawn = 8;
spawn_location= {row: 2, col: 2}
enemy_path = [
	{row: 3, col: 3},
	{row: 4, col: 4},
	{row: 5, col: 5},
	{row: 6, col: 4},
	{row: 7, col: 5},
	{row: 8, col: 6},
	{row: 9, col: 7},
	{row: 10, col: 8},
	{row: 11, col: 9},
	{row: 12, col: 10},
	{row: 13, col: 9},
	{row: 14, col: 10},

];

timerForRespawn = 1;
can_spawn = true

function spawn_enemies(){
	if(enemies_to_spawn - enemies_spawned > 0 && can_spawn){
		var _tile = get_tile(spawn_location.row, spawn_location.col)
		instance_create_depth(_tile.x, _tile.y - (_tile.sprite_height / 4), _tile.depth - 9997, obj_enemy, {path: enemy_path})	
		enemies_spawned++;
		can_spawn = false;
		alarm[0] = timerForRespawn * 60;
	}
}