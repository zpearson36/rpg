/// @description Insert description here
// You can write your code in this editor
draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)

if(options_list != 4)
{
	for(var i = 0; i < array_length(party.get_members()); i++)
	{
		// Draw Character and Equipment
		draw_sprite(party.get_members()[i].get_sprite(), -1, x + op_border, y + op_border + 125*i)
		draw_sprite(party.get_members()[i].get_armour().get_sprite(), -1, x + op_border, y + op_border + 125*i)
		draw_sprite(party.get_members()[i].get_weapon().get_sprite(), -1, x + op_border, y + op_border + 125*i)
		draw_text(x + op_border + 75, y + op_border +  5 + 125*i, $"Level: {party.get_members()[i].get_level()}")
		draw_text(x + op_border + 75, y + op_border + 25 + 125*i, $"Health: {party.get_members()[i].get_hp()} / {party.get_members()[i].get_hp_max()}")
		if(currently_selected == i and  char_menu and select_character) draw_rectangle(x + op_border, y + op_border + 125*i,  x + w - op_border, y + op_border + 120*(i + 1), true)
	}
}
else
{
    	// Draw Character and Equipment
		draw_sprite(selected_character.get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(selected_character.get_armour().get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(selected_character.get_weapon().get_sprite(), -1, x + op_border, y + op_border)
		draw_text(x + op_border + 75, y + op_border +  5, $"Level: {selected_character.get_level()}")
		draw_text(x + op_border + 75, y + op_border + 25, $"Health: {selected_character.get_hp()} / {selected_character.get_hp_max()}")
		for(var i = 0; i < ds_map_size(selected_character.get_attrs().get_attributes()); i++)
		{
			var tmp = selected_character.get_attrs().get_attributes()
			draw_text(x + op_border + 75 + 75 * floor( i / 4 ), y + op_border +  75 + 20*(i % 4) , $"{ds_map_keys_to_array(tmp)[i]}: {selected_character.get_attr(ds_map_keys_to_array(tmp)[i])}")
		}
		for(var i = 0; i < ds_map_size(selected_character.get_skills().get_skills()); i++)
		{
			var tmp = selected_character.get_skills().get_skills()
			draw_text(x + op_border + 75, y + op_border +  185 + 20*i, $"{ds_map_keys_to_array(tmp)[i]}: {selected_character.get_skills().get_skill(ds_map_keys_to_array(tmp)[i]).get_value()}")
		}

}

for(var i = 0; i < array_length(options[options_list]); i++)
{
	if(currently_selected == i and side_menu) draw_set_color(c_yellow)
	draw_text(x + w + op_border, y + op_border + op_space*i, options[options_list][i][0])
	draw_set_color(c_white)
}