/// @description Insert description here
// You can write your code in this editor
		draw_sprite_ext(sMenuBackground, -1, x, y, w / sprite_width, h / sprite_height, 0, c_white, 1)
		draw_sprite_ext(sMenuBackground, -1, x + w, y, width / sprite_width, height / sprite_height, 0, c_white, 1)
		for(var i = 0; i < array_length(options); i++)
		{
			if(currently_selected == i and side_menu) draw_set_color(c_yellow)
			draw_text(x + w + op_border, y + op_border + op_space*i, options[i][0])
			draw_set_color(c_white)
		}
		for(var i = 0; i < array_length(equipment_list); i++)
		{
			switch(equipment_list[i].get_item_type())
			{
				case ItemTypes.WEAPON:
				{
					//draw weapon info
					draw_text(x + op_border +  75, y + op_border +   5 + 70*i, $"Weapon: ")
					draw_sprite(equipment_list[i].get_sprite(), -1, x + op_border, y + op_border +  5 + 70*i)
					draw_text(x + op_border + 160, y + op_border +   5 + 70*i, $"Name:   {equipment_list[i].get_name()}")
					draw_text(x + op_border + 160, y + op_border +  25 + 70*i, $"Range:  {equipment_list[i].get_min_range()} / {equipment_list[i].get_max_range()}")
					draw_text(x + op_border + 160, y + op_border +  45 + 70*i, $"Damage: {equipment_list[i].get_min_damage()} / {equipment_list[i].get_max_damage()}")

					break;
				}
				case ItemTypes.ARMOUR:
				{
					//draw armour info
					draw_text(x + op_border + 75, y + op_border +   5 + 70*i, $"Armour: ")
					draw_sprite(equipment_list[i].get_sprite(), -1,  x + w - 150, y + op_border +  5 + 70*i)
					draw_text(x + op_border + 160,  y + op_border +   5 + 70*i, $"Name: {equipment_list[i].get_name()}")
					draw_text(x + op_border + 160, y + op_border +    25 + 70*i, $"Damage Threshold:  {equipment_list[i].get_threshold()}")
					draw_text(x + op_border + 160, y + op_border +    45 + 70*i, $"Damage Resistance: {equipment_list[i].get_resistance()}")
					break;
				}
			}
		}
		if(currently_selected != -1)
		{
			draw_rectangle(x + op_border + 75, y + op_border + 5 + 70*currently_selected,  x + w - op_border , y + op_border + 5 + 70*(currently_selected + 1), true)
		}
/*
switch(options_list)
{
	case 0:
	case 1:
	case 2:
	case 3:
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
		break;
	}
	case 4:
	{
	    // Draw Character and Equipment
		draw_sprite(character.get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_armour().get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_weapon().get_sprite(), -1, x + op_border, y + op_border)
		draw_text(x + op_border + 75, y + op_border +  5, $"Level: {character.get_level()}")
		draw_text(x + op_border + 75, y + op_border + 25, $"Health: {character.get_hp()} / {character.get_hp_max()}")
		for(var i = 0; i < ds_map_size(character.get_attrs().get_attributes()); i++)
		{
			var tmp = character.get_attrs().get_attributes()
			draw_text(x + op_border + 75 + 75 * floor( i / 4 ), y + op_border +  75 + 20*(i % 4) , $"{ds_map_keys_to_array(tmp)[i]}: {character.get_attr(ds_map_keys_to_array(tmp)[i])}")
		}
		for(var i = 0; i < ds_map_size(character.get_skills().get_skills()); i++)
		{
			var tmp = character.get_skills().get_skills()
			draw_text(x + op_border + 75, y + op_border +  185 + 20*i, $"{ds_map_keys_to_array(tmp)[i]}: {character.get_skills().get_skill(ds_map_keys_to_array(tmp)[i]).get_value()}")
		}
		break;
	}
	case 5:
	{
	    // Draw Character and Equipment
		draw_sprite(character.get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_armour().get_sprite(), -1, x + op_border, y + op_border)
		draw_sprite(character.get_weapon().get_sprite(), -1, x + op_border, y + op_border)
		
		//draw weapon info
		draw_text(x + op_border + 75, y + op_border +  5, $"Weapon: ")
		draw_sprite(character.get_weapon().get_sprite(), -1, x + w - 150, y + op_border +  5)
		draw_text(x + op_border + 160, y + op_border +   5, $"Name:   {character.get_weapon().get_name()}")
		draw_text(x + op_border + 160, y + op_border +  25, $"Range:  {character.get_weapon().get_min_range()} / {character.get_weapon().get_max_range()}")
		draw_text(x + op_border + 160, y + op_border +  45, $"Damage: {character.get_weapon().get_min_damage()} / {character.get_weapon().get_max_damage()}")
		
		//draw armour info
		draw_text(x + op_border + 75, y + op_border +  75, $"Armour: ")
		draw_sprite(character.get_armour().get_sprite(), -1,  x + w - 150, y + op_border +  75)
		draw_text(x + op_border + 160, y + op_border +   75, $"Name: {character.get_armour().get_name()}")
		draw_text(x + op_border + 160, y + op_border +   95, $"Damage Threshold:  {character.get_armour().get_threshold()}")
		draw_text(x + op_border + 160, y + op_border +  115, $"Damage Resistance: {character.get_armour().get_resistance()}")
		
		if(currently_selected != -1)
		{
			draw_rectangle(x + op_border + 75, y + op_border + 5 + 70*currently_selected,  x + w - op_border , y + op_border + 5 + 70*(currently_selected + 1), true)
		}
		break;
	}
	case 6:
	{
		var indx = 0
		for(var i = 0; i < array_length(ds_map_keys_to_array(party.get_inventory().get_inv())); i++)
		{
			var t = ds_map_keys_to_array(party.get_inventory().get_inv())[i]
			
			switch(party.get_inventory().get_inv()[? t].get_type())
			{
				case ItemTypes.WEAPON:
				{
					if(selected_equipment == ItemTypes.WEAPON)
					{
						//draw weapon info
						draw_text(x + op_border +  75, y + op_border +   5, $"Weapon: ")
						draw_sprite(character.get_weapon().get_sprite(), -1, x + op_border, y + op_border +  5)
						draw_text(x + op_border + 160, y + op_border +   5, $"Name:   {character.get_weapon().get_name()}")
						draw_text(x + op_border + 160, y + op_border +  25, $"Range:  {character.get_weapon().get_min_range()} / {character.get_weapon().get_max_range()}")
						draw_text(x + op_border + 160, y + op_border +  45, $"Damage: {character.get_weapon().get_min_damage()} / {character.get_weapon().get_max_damage()}")
					}
					break;
				}
				case ItemTypes.ARMOUR:
				{
					if(selected_equipment = ItemTypes.ARMOUR)
					{
						//draw armour info
						draw_text(x + op_border + 75, y + op_border +  75, $"Armour: ")
						draw_sprite(character.get_armour().get_sprite(), -1,  x + w - 150, y + op_border +  75)
						draw_text(x + op_border + 160, y + op_border +   75, $"Name: {character.get_armour().get_name()}")
						draw_text(x + op_border + 160, y + op_border +   95, $"Damage Threshold:  {character.get_armour().get_threshold()}")
						draw_text(x + op_border + 160, y + op_border +  115, $"Damage Resistance: {character.get_armour().get_resistance()}")
					}
					break;
				}
			}
			var t = ds_map_keys_to_array(party.get_inventory().get_inv())[i]
			options[2][i] = [party.get_inventory().get_inv()[? t].get_name(), function(){}]
		}
		break;
	}
}


*/