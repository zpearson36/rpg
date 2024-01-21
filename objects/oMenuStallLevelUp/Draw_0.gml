/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y + height, widthb / sprite_width, (heightb / sprite_height), 0, c_white, 1)
for(var i = 0; i < array_length(options); i++)
{
	
	if(options[i] != "")
	{
		if(currently_selected == i and side_menu) draw_set_color(c_yellow)
		draw_text(x + w + op_border, y + op_border + op_space*i, options[i][0])
		draw_set_color(c_white)
	}
}
for(var i = 0; i < array_length(party.get_members()); i++)
{
	// Draw Character and Equipment
	draw_sprite(party.get_members()[i].get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_sprite(party.get_members()[i].get_armour().get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_sprite(party.get_members()[i].get_weapon().get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_text(x + op_border + 75, y + op_border +  5 + 125*i, $"Level: {party.get_members()[i].get_level()}")
	draw_text(x + op_border + 75, y + op_border + 25 + 125*i, $"Health: {party.get_members()[i].get_hp()} / {party.get_members()[i].get_hp_max()}")
	if(currently_selected == i and  char_menu) draw_rectangle(x + op_border, y + op_border + 125*i,  x + w - op_border, y + op_border + 120*(i + 1), true)
	else{
		draw_set_color(c_black)
		draw_set_alpha(.1)
		draw_rectangle(x + op_border, y + op_border + 125*i,  x + w - op_border, y + op_border + 120*(i + 1), false)
		draw_set_alpha(1)
		draw_set_color(c_white)
	}
}
draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())