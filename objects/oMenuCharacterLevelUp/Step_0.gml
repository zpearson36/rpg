/// @description Insert description here
// You can write your code in this editor
side_menu = false
char_menu = false
if(mouse_x > x + w + op_border and mouse_x < x + w + width - op_border)
{
	side_menu = true
	currently_selected = floor((mouse_y - (y + op_border))/ op_space)
	if(currently_selected >= array_length(options)) currently_selected = -1
	if(currently_selected < 0) currently_selected = -1

	if(mouse_check_button_pressed(mb_left) and currently_selected != -1)
	{
		script_execute(options[currently_selected][1])
	}
}
var c_attrs = character.get_attrs().get_attributes()
var c_attrs_keys = []
var c_skills = character.get_skills().get_skills()
var c_skills_keys = []
ds_map_keys_to_array(c_attrs, c_attrs_keys)
ds_map_keys_to_array(c_skills, c_skills_keys)
total_skill_cost = 0
for(var i = 0; i < ds_map_size(c_attrs); i++)
{
	if(mouse_check_button_pressed(mb_left))
	{
		//attribute increase/decrease
		//draw arrows to increase or decrease value
		var xx_left = x + op_border + 60 + 75 * floor( i / 4 )
		var xx_right = x + op_border + 148 + 75 * floor( i / 4 )
		var yy = y + op_border + 112 + 20*(i % 4)
		var c1 = c_dkgray
		var c2 = c_dkgray
		var c3 = c_white
		var c4 = c_white
		if(mouse_x > xx_left - 8 and mouse_x < xx_left + 8 and mouse_y > yy - 8 and mouse_y < yy + 8
		   and get_attribute_cost(1) + total_skill_cost <= party.get_gold())
		{
			attributes.increment_attr(c_attrs_keys[i])
		}
		if(mouse_x > xx_right - 8 and mouse_x < xx_right + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
		{
			if(attributes.get_attr(c_attrs_keys[i]).get_value() > 0)
				attributes.decrement_attr(c_attrs_keys[i])
		}
	}
}
for(var i = 0; i < ds_map_size(skills.get_skills()); i++)
{
	if(skills.get_skill(c_skills_keys[i]).get_value())
	{
		total_skill_cost += get_skill_cost(c_skills_keys[i])
	}
}
for(var i = 0; i < ds_map_size(skills.get_skills()); i++)
{
	if(mouse_check_button_pressed(mb_left))
	{
		//skill increase/decrease
		var xx_left = x + op_border + 60 + 75 * floor( i / 8 )
		var xx_right = x + op_border + 190 + 75 * floor( i / 8 )
		var yy = y + op_border + 260 + 20*(i % 4)
		var c1 = c_dkgray
		var c2 = c_dkgray
		var c3 = c_white
		var c4 = c_white
		
		if(mouse_x > xx_left - 8 and mouse_x < xx_left + 8 and mouse_y > yy - 8 and mouse_y < yy + 8
		   and get_cost_of_next_skill(c_skills_keys[i]) + total_skill_cost + get_attribute_cost(0) <= party.get_gold())
		{
			skills.get_skill(c_skills_keys[i]).increase_value()
		}
		if(mouse_x > xx_right - 8 and mouse_x < xx_right + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
		{
			if(skills.get_skill(c_skills_keys[i]).get_value() > 0)
				skills.get_skill(c_skills_keys[i]).decrease_value()
		}
	}
}

if(mouse_check_button_pressed(mb_right)) back()