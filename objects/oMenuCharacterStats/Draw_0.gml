/// @description Insert description here
// You can write your code in this editor
		draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
		draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)
		for(var i = 0; i < array_length(options); i++)
		{
			if(options[i] != "")
			{
				if(currently_selected == i and side_menu) draw_set_color(c_yellow)
				draw_text(x + w + op_border, y + op_border + op_space*i, options[i][0])
				draw_set_color(c_white)
			}
		}
		// Draw Character and Equipment
		draw_sprite(character.get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_armour().get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_weapon().get_sprite(), -1, x + op_border, y + op_border)
		draw_text(x + op_border + 75, y + op_border +  5, $"Level: {character.get_level()}")
		draw_text(x + op_border + 75, y + op_border + 25, $"Health: {character.get_hp()} / {character.get_hp_max()}")
		for(var i = 0; i < ds_map_size(character.get_attrs().get_attributes()); i++)
		{
			var tmp = character.get_attrs().get_attributes()
			draw_text(x + op_border + 75 + 75 * floor( i / 4 ), y + op_border +  75 + 20*(i % 4) , $"{ds_map_keys_to_array(tmp)[i]}: {character.get_attr(ds_map_keys_to_array(tmp)[i]).get_value()}")
		}
		for(var i = 0; i < ds_map_size(character.get_skills().get_skills()); i++)
		{
			var tmp = character.get_skills().get_skills()
			draw_text(x + op_border + 75, y + op_border +  185 + 20*i, $"{ds_map_keys_to_array(tmp)[i]}: {character.get_skills().get_skill(ds_map_keys_to_array(tmp)[i]).get_value()}")
		}

