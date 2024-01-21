

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

function calculate_reward(encounter_level)
{
	return 100 * encounter_level
}