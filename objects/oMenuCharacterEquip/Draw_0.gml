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
if(currently_selected != -1 and char_menu)
{
	draw_rectangle(x + op_border + 75, y + op_border + 5 + 70*currently_selected,  x + w - op_border , y + op_border + 5 + 70*(currently_selected + 1), true)
}
