/// @description Insert description here
// You can write your code in this editor

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

//scroll bar functionality
scroll_hover_up = false
scroll_hover_down = false
if(mouse_x > x + 25 - 8 and mouse_x < x + 25 + 8 and mouse_y > y + 35 - 8 and mouse_y < y + 35 + 8) scroll_hover_up = true
if(mouse_x > x + 25 - 8 and mouse_x < x + 25 + 8 and mouse_y > y + h - 35 - 8 and mouse_y < y + h - 35 + 8) scroll_hover_down = true
if(scroll_hover_down and mouse_check_button_pressed(mb_left))
{
	scroll_offset++
	scroll_offset = min(scroll_offset, max(ds_map_size(inventory.get_inv()) - 6, 0))
}
if(scroll_hover_up and mouse_check_button_pressed(mb_left))
{
	scroll_offset --
	scroll_offset = max(scroll_offset, 0)
}

	if(mouse_check_button_pressed(mb_right)) manager.close()