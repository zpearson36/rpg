

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

function chance_to_hit(_atkr, _targ, _tile = undefined)
{
	if(_tile == undefined) _tile = _atkr.get_tile()
	//print(_targ)
	var dist =  dist_to_targ(_tile, _targ.get_tile())
	var hit_chance = -1
	//print("================")
	//print(dist)
	//print(_atkr.get_attack_range_min())
	//print(_atkr.get_attack_range_max())
	//print("================")
	if(dist >= _atkr.get_attack_range_min() and dist <= _atkr.get_attack_range_max())
	    hit_chance = .40
	
	return hit_chance
}

function ap_to_move(char, targ_pos)
{
	return ceil(dist_to_targ(char.get_tile(), targ_pos) / char.get_attr("spd"))
}

function dist_to_targ(_curr, _targ)
{
	return point_distance(_targ.get_x(),
	                      _targ.get_y(),
						  _curr.get_x(),
						  _curr.get_y()
						  )
}