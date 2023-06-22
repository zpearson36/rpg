/// @description Insert description here
// You can write your code in this editor
currently_selected = -1
if(mouse_x > op_lborder and mouse_x < op_lborder + 100)
{
	currently_selected = floor((mouse_y - (room_height - op_bborder - (array_length(options) - 1) * (op_space + 25))) / (op_space + 25))
	if(currently_selected >= array_length(options)) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1
	if(mouse_y - (room_height - op_bborder - (array_length(options) - 1) * (op_space + 25)) - 35*currently_selected > 20) currently_selected = -1
	

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		script_execute(options[currently_selected][1])
	}
}