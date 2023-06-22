

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

function chance_to_hit(_atkr, _targ, t = false, _tile = undefined)
{
	if(_tile == undefined) _tile = _atkr.get_tile()
	var dist = dist_to_targ(_tile, _targ.get_tile())
	var hit_chance = 0
	if(ceil(dist) >= _atkr.get_attack_range_min() and ceil(dist) <= _atkr.get_attack_range_max() and not _targ.get_tile().is_obstructed())
	    hit_chance = _atkr.get_skills().get_skill(_atkr.get_weapon().get_name()).get_value()
	
	return hit_chance
}

function ap_to_move(char, targ_pos)
{
	return ceil(dist_to_targ(char.get_tile(), targ_pos) / char.get_attr("spd").get_value())
}

function dist_to_targ(_curr, _targ)
{
	return point_distance(_targ.get_x(),
	                      _targ.get_y(),
						  _curr.get_x(),
						  _curr.get_y()
						  )
}

function attribute_cost(_attr_points)
{
	return 6 * power(_attr_points, 2)//0.02 * power(_attr_points,3) + 3.06 * power(_attr_points,2) + 105.6 * _attr_points - 895
}