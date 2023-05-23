/// @description Insert description here
// You can write your code in this editor
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
		script_execute(options[options_list][currently_selected][1])
	}
}
if(mouse_x > x + op_border and mouse_x < x + w - op_border)
{
	char_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ 125)
	if(currently_selected >= array_length(party.get_members())) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1 and select_character)
	{
		selected_character = party.get_members()[currently_selected]
		options_list = 4
	}
}

