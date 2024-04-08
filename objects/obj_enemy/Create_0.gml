target_index = 0;

function current_target(){
	if(target_index < array_length(path)){
		return path[target_index];
	}
	
	return undefined;
}

function next_target(){
	if(target_index < array_length(path)) target_index++;
}