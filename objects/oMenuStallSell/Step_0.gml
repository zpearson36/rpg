/// @description Insert description here
// You can write your code in this editor
char_menu = false
side_menu = false
currently_selected = -1
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
if(mouse_x > x + 35 + op_border and mouse_x < x + w - op_border)
{
	char_menu = true
	currently_selected = floor((mouse_y - (y + op_border)) / 70)
	if(currently_selected >= ds_map_size(party.get_inventory().get_inv()) or currently_selected > 5) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		var p_inv = party.get_inventory().get_inv()
		var p_inv_keys = []
		ds_map_keys_to_array(p_inv, p_inv_keys)
		var item = p_inv[? p_inv_keys[currently_selected]]
		
		var s_inv = stall.get_inventory()
		party.add_gold(item.get_value())
		s_inv.add_item(party.get_inventory().get_item(item))
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
	scroll_offset = min(scroll_offset, max(ds_map_size(party.get_inventory().get_inv()) - 6, 0))
}
if(scroll_hover_up and mouse_check_button_pressed(mb_left))
{
	scroll_offset --
	scroll_offset = max(scroll_offset, 0)
}





if(mouse_check_button_pressed(mb_right)) manager.close()