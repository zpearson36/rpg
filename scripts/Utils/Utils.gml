

function array_delete_index(_array, _index)
{
	var new_array = []
	var new_index = 0
	for(var i = new_index; new_index < array_length(_array); i++)
	{
		new_index = i;
		if(i >= _index) new_index++
		if(new_index < array_length(_array)) new_array[i] = _array[new_index]
	}
	
	return new_array
}

function print(str)
{
	show_debug_message(str)
}

function chance_to_hit(_atkr, _targ)
{
	var dist =  dist_to_targ(_atkr.get_tile(), _targ.get_tile())
	var hit_chance = 0
	if(dist >= _atkr.get_attack_range_min() and dist <= _atkr.get_attack_range_max())
	    hit_chance = .40
	
	return hit_chance
}

function ap_to_move(current_pos, targ_pos)
{
}

function dist_to_targ(_curr, _targ)
{
	return point_distance(_targ.get_x(),
	                      _targ.get_y(),
						  _curr.get_x(),
						  _curr.get_y()
						  )
}