/// @description Insert description here
// You can write your code in this editor

draw_set_font(-1)
draw_set_halign(-1)
draw_set_valign(-1)
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
var inv = party.get_inventory().get_inv()
var inv_keys = []
ds_map_keys_to_array(inv, inv_keys)

var ratio = min(1, 6 / array_length(inv_keys))
draw_sprite_ext(sScrollBar, -1, x + 25, y + 35 + 16 + scroll_offset * (408 - ratio * 408) / (array_length(inv_keys) - 6), 1, min(1, 6 / array_length(inv_keys)), 0, c_white, 1)
draw_sprite(sScrollArrowUp, -1, x + 25, y + 35)
draw_sprite(sScrollArrowDown, -1, x + 25, y + h - 35)
for(var i = 0; i + scroll_offset < array_length(inv_keys) and i < 6; i++)
{
	switch(inv[? inv_keys[i + scroll_offset]].get_item_type())
	{
		case ItemTypes.WEAPON:
		{
			//draw weapon info
			draw_text(x + op_border +  75, y + op_border +   5 + 70*i, $"Weapon: ")
			draw_sprite(inv[? inv_keys[i + scroll_offset]].get_sprite(), -1, x + w - 225, y + op_border +  5 + 70*i)
			draw_text(x + op_border + 160, y + op_border +   5 + 70*i, $"Name:   {inv[? inv_keys[i + scroll_offset]].get_name()}")
			draw_text(x + op_border + 160, y + op_border +  25 + 70*i, $"Base Damage: {inv[? inv_keys[i + scroll_offset]].get_base_damage()}")
			var scaling = inv[? inv_keys[i + scroll_offset]].get_scaling().get_attributes()
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

			break;
		}
		case ItemTypes.ARMOUR:
		{
			//draw armour info
			draw_text(x + op_border + 75, y + op_border +   5 + 70*i, $"Armour: ")
			draw_sprite(inv[? inv_keys[i + scroll_offset]].get_sprite(), -1,  x + w - 200, y + op_border +  5 + 70*i)
			draw_text(x + op_border + 160,  y + op_border +   5 + 70*i, $"Name: {inv[? inv_keys[i + scroll_offset]].get_name()}")
			draw_text(x + op_border + 160, y + op_border +    25 + 70*i, $"Damage Threshold:  {inv[? inv_keys[i + scroll_offset]].get_threshold()}")
			draw_text(x + op_border + 160, y + op_border +    45 + 70*i, $"Damage Resistance: {inv[? inv_keys[i + scroll_offset]].get_resistance()}")
			break;
		}
	}
			draw_text(x + op_border + w - 150, y + op_border +   5 + 70*i, $"Sell For:")
			draw_text(x + op_border + w - 100, y + op_border +  25 + 70*i, $"{inv[? inv_keys[i + scroll_offset]].get_value()}")
}
if(currently_selected != -1 and char_menu)
{
	draw_rectangle(x + op_border + 75, y + op_border + 5 + 70*currently_selected,  x + w - op_border , y + op_border + 5 + 70*(currently_selected + 1), true)
}

draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())