/// @description Insert description here
// You can write your code in this editor
side_menu = false
char_menu = false
if(mouse_x > x + w + op_border and mouse_x < x + w + width - op_border)
{
	side_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ op_space)
	if(currently_selected >= array_length(options)) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		script_execute(options[currently_selected][1])
	}
}
if(mouse_x > x + op_border and mouse_x < x + w - op_border)
{
	char_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ 75)
	
	//Currently set to 2 as only need to display "weapon" and "armour"
	//need to update to accomodate additional equipable items.
	if(currently_selected >= 2) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		var item_type = undefined
		switch(currently_selected)
		{
			case 0: {item_type = ItemTypes.WEAPON; break}
			case 1: {item_type = ItemTypes.ARMOUR; break}
		}
		var matching_items = []
		var keys = ds_map_keys_to_array(party.get_inventory().get_inv())
		var inv = party.get_inventory().get_inv()
		for(var i = 0; i < array_length(ds_map_keys_to_array(party.get_inventory().get_inv())); i++)
		{
			if(inv[? keys[i]].get_item_type() == item_type)
				array_push(matching_items, inv[? keys[i]])
		}
		manager.set_menu(next_menu, [character, matching_items])
	}
}
	
	if(mouse_check_button_pressed(mb_right)) back()