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
		
		//draw weapon info
		draw_text(x + op_border + 75, y + op_border +  5, $"Weapon: ")
		draw_sprite(character.get_weapon().get_sprite(), -1, x + w - 150, y + op_border +  5)
		draw_text(x + op_border + 160, y + op_border +   5, $"Name:   {character.get_weapon().get_name()}")
		draw_text(x + op_border + 160, y + op_border +  25, $"Base Damage: {character.get_weapon().get_base_damage()} +{character.get_scaling_damage() * character.get_weapon().get_base_damage()}")
			var scaling = character.get_weapon().get_scaling().get_attributes()
			var scaling_keys = ds_map_keys_to_array(scaling)
			var scaling_string = ""
			for(var scale_ind = 0; scale_ind < array_length(scaling_keys); scale_ind++)
			{
				var tmp = ""
				var val = scaling[? scaling_keys[scale_ind]].get_value()
				if(val == 0)      tmp = "-"
				else if(val < 20) tmp = "E"
				else if(val < 40) tmp = "D"
				else if(val < 60) tmp = "C"
				else if(val < 80) tmp = "B"
				else              tmp = "A"
				scaling_string += $"{scaling_keys[scale_ind]}:{tmp}"
				if(scale_ind < array_length(scaling_keys))
				    scaling_string += " "
			}
			draw_text(x + op_border + 160, y + op_border +  45 + 70*i, $"Scaling: {scaling_string}")
		
		//draw armour info
		draw_text(x + op_border + 75, y + op_border +  75, $"Armour: ")
		draw_sprite(character.get_armour().get_sprite(), -1,  x + w - 150, y + op_border +  75)
		draw_text(x + op_border + 160, y + op_border +   75, $"Name: {character.get_armour().get_name()}")
		draw_text(x + op_border + 160, y + op_border +   95, $"Damage Threshold:  {character.get_armour().get_threshold()}")
		draw_text(x + op_border + 160, y + op_border +  115, $"Damage Resistance: {character.get_armour().get_resistance()}")
		
		if(currently_selected != -1 and char_menu)
		{
			draw_rectangle(x + op_border + 75, y + op_border + 5 + 70*currently_selected,  x + w - op_border , y + op_border + 5 + 70*(currently_selected + 1), true)
		}

