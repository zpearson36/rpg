/// @description Insert description here
// You can write your code in this editor
if(party != undefined)
{
	function to_main() {options_list = 0; select_character = false; selected_character = noone}
	var i
	for(i = 0; i < array_length(ds_map_keys_to_array(party.get_inventory().get_inv())); i++)
	{
		var t = ds_map_keys_to_array(party.get_inventory().get_inv())[i]
		options[2][i] = [party.get_inventory().get_inv()[? t].get_name(), function(){}]
	}
    options[2][i] = ["Back", to_main]
}
switch(state)
{
	case MENUSTATES.ACTIVE:
	{
		break;
	}
}
side_menu = false
char_menu = false
currently_selected = -1

if(mouse_x > x + w + op_border and mouse_x < x + w + width - op_border)
{
	side_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ op_space)
	if(currently_selected >= array_length(options[options_list])) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		//print(options[options_list][currently_selected][0])
		script_execute(options[options_list][currently_selected][1])
	}
}
if(mouse_x > x + op_border and mouse_x < x + w - op_border)
{
	char_menu = true
	if(select_character)
	{
		currently_selected = floor((mouse_y - (y + op_border))/ 125)
		if(currently_selected >= array_length(party.get_members())) currently_selected = -1
		if(currently_selected < 0) currently_selected = -1

		if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
		{
			selected_character = party.get_members()[currently_selected]
		
			switch(options_list)
			{
				case 1:{options_list = 4; select_character = false; break;}
				case 3:{options_list = 5; select_character = false; select_equipment = true; break;}
			}
		}
	}
	if(select_equipment and mouse_x > x + op_border + 75)
	{
		currently_selected = floor((mouse_y - (y + op_border + 5))/ 70)
		if(currently_selected >= array_length(party.get_members())) currently_selected = -1
		if(currently_selected < 0) currently_selected = -1

		if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
		{
			if(currently_selected == 0) selected_equipment = ItemTypes.WEAPON
			if(currently_selected == 1) selected_equipment = ItemTypes.ARMOUR
			options_list = 6;
		}
	}
}

//show_debug_message(currently_selected)
print($"char:{currently_selected} equip:{selected_equipment}")
