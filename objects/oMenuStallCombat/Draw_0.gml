/// @description Insert description here
// You can write your code in this editor

draw_set_font(-1)
draw_set_halign(-1)
draw_set_valign(-1)
draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y + height, widthb / sprite_width, (heightb / sprite_height), 0, c_white, 1)

var ratio = min(1, number_per_page / array_length(scenarios))
draw_sprite_ext(sScrollBar, -1, x + 25, y + 35 + 16 + scroll_offset * (408 - ratio * 408) / (array_length(scenarios) - number_per_page), 1, min(1, number_per_page / array_length(scenarios)), 0, c_white, 1)
draw_sprite(sScrollArrowUp, -1, x + 25, y + 35)
draw_sprite(sScrollArrowDown, -1, x + 25, y + h - 35)

for(var i = 0; i < array_length(options); i++)
{
	if(options[i] != "")
	{
		if(currently_selected == i and side_menu) draw_set_color(c_yellow)
		draw_text(x + w + op_border, y + op_border + op_space*i, options[i][0])
		draw_set_color(c_white)
	}
}
for(var i = 0; i + scroll_offset < array_length(scenarios) and i < number_per_page; i++)
{
	// Draw Character and Equipment
	draw_text(x + op_border + 75, y + op_border + sc_space * min(1, i) + sc_height*i, $"Enemy Number: {scenarios[i + scroll_offset].get_enemy_count()}")
	//draw_text(x + op_border + 75, y + op_border + 25 + 125*i, $"Level: {party.get_members()[i].get_hp()} / {party.get_members()[i].get_hp_max()}")
	if(currently_selected == i and  char_menu) draw_rectangle(x + op_border + 16, y + op_border + sc_space * min(1, i) + sc_height*i, x + w - op_border, y + op_border + sc_height*(i + 1), true)
	else{
		draw_set_color(c_black)
		draw_set_alpha(.1)
		draw_rectangle(x + op_border + 16, y + op_border + sc_space * min(1, i) + sc_height*i,  x + w - op_border, y + op_border + sc_height*(i + 1), false)
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
}

draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())