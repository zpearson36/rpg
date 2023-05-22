/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)

for(var i = 0; i < array_length(party.get_members()); i++)
{
	// Draw Character and Equipment
	draw_sprite(party.get_members()[i].get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_sprite(party.get_members()[i].get_armour().get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_sprite(party.get_members()[i].get_weapon().get_sprite(), -1, x + op_border, y + op_border + 125*i)
	draw_text(x + op_border + 75, y + op_border +  5 + 125*i, $"Level: {party.get_members()[i].get_level()}")
	draw_text(x + op_border + 75, y + op_border + 25 + 125*i, $"Health: {party.get_members()[i].get_hp()} / {party.get_members()[i].get_hp_max()}")
}

for(var i = 0; i < array_length(options[options_list]); i++)
{
	if(currently_selected == i) draw_set_color(c_yellow)
	draw_text(x + w + op_border, y + op_border + op_space*i, options[options_list][i][0])
	draw_set_color(c_white)
}