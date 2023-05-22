// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Inventory() constructor
{
	inv_map = ds_map_create()
	
	function add_item(_item)
	{
		ds_map_add(inv_list,_item.get_name(), _item)
	}
	
	function get_item(_item)
	{
		var tmp = inv_map[? _item.get_name()]
		ds_map_delete(inv_map, _item.get_name())
		
		return tmp
	}
}