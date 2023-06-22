/// @description Insert description here
// You can write your code in this editor
for(var i = array_length(options) - 1; i >= 0; i--)
{
	if(i == currently_selected) draw_set_color(c_yellow)
	draw_text(op_lborder, room_height - op_bborder - (op_space + 25) * (array_length(options) - 1 - i), options[i][0])
	draw_set_color(c_white)
}