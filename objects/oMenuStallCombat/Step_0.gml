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

if(mouse_x > x + op_border + 16 and mouse_x < x + w - op_border)
{
	char_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ (sc_height))
	if(currently_selected >= array_length(scenarios)) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1
	if(mouse_y - (y + op_border) < sc_height * currently_selected + sc_space) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		GameManager.to_combat(scenarios[currently_selected])
		to_close()
	}
}

//scroll bar functionality
scroll_hover_up = false
scroll_hover_down = false
if(mouse_x > x + 25 - 8 and mouse_x < x + 25 + 8 and mouse_y > y + 35 - 8 and mouse_y < y + 35 + 8) scroll_hover_up = true
if(mouse_x > x + 25 - 8 and mouse_x < x + 25 + 8 and mouse_y > y + h - 35 - 8 and mouse_y < y + h - 35 + 8) scroll_hover_down = true
/*print($"{scroll_hover_down}::{scroll_hover_up}"
+ $"::{mouse_x}::{x + 25 - 8}::{x + 25 + 8}"
+ $"::{mouse_y}::{y + h - 35 - 8}::{y + h - 35 + 8}")*/

if((scroll_hover_down and mouse_check_button_pressed(mb_left)) or (char_menu and mouse_wheel_down()))
{
	scroll_offset++
	scroll_offset = min(scroll_offset, max(array_length(scenarios) - number_per_page, 0))
}
if((scroll_hover_up and mouse_check_button_pressed(mb_left)) or (char_menu and mouse_wheel_up()))
{
	scroll_offset--
	scroll_offset = max(scroll_offset, 0)
}
print(scroll_offset)

	if(mouse_check_button_pressed(mb_right)) manager.close()