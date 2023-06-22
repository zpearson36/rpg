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
// Draw Character and Equipment
draw_sprite(character.get_sprite(), -1, x + op_border, y + op_border)
draw_sprite(character.get_armour().get_sprite(), -1, x + op_border, y + op_border)
draw_sprite(character.get_weapon().get_sprite(), -1, x + op_border, y + op_border)
draw_text(x + op_border + 75, y + op_border +  5, $"Level: {character.get_level()}")
draw_text(x + op_border + 75, y + op_border + 25, $"Health: {character.get_hp()} / {character.get_hp_max()}")


//draw attribute interface
draw_text(x + op_border + 50, y + op_border + 75, $"Cost of Next Attribute: ")
draw_text(x + op_border + 340, y + op_border + 75, $"Total Attribute Cost: ")
if(get_attribute_cost(1) + total_skill_cost> party.get_gold()) draw_set_color(c_red)
draw_text(x + op_border + 260, y + op_border + 75, $"{get_attribute_cost(1) - get_attribute_cost()}")
draw_set_color(c_white)
if(get_attribute_cost(0) > party.get_gold()) draw_set_color(c_red)
draw_text(x + op_border + 535, y + op_border + 75, $"{get_attribute_cost()}")
draw_set_color(c_white)

var c_attrs = character.get_attrs().get_attributes()
var c_attrs_keys = []
ds_map_keys_to_array(c_attrs, c_attrs_keys)
for(var i = 0; i < ds_map_size(character.get_attrs().get_attributes()); i++)
{
	
	//draw arrows to increase or decrease value
	var xx_left = x + op_border + 60 + 75 * floor( i / 4 )
	var xx_right = x + op_border + 148 + 75 * floor( i / 4 )
	var yy = y + op_border + 112 + 20*(i % 4)
	var c1 = c_dkgray
	var c2 = c_dkgray
	var c3 = c_white
	var c4 = c_white
	if(mouse_x > xx_left - 8 and mouse_x < xx_left + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
	{
		c1 = c_ltgray
		c3 = c_yellow
	}
	if(mouse_x > xx_right - 8 and mouse_x < xx_right + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
	{
		c2 = c_ltgray
		c4 = c_yellow
	}
	draw_rectangle_color(xx_left - 8, yy - 8, xx_left + 8, yy + 8, c1, c1, c1, c1, false)
	draw_rectangle_color(xx_left - 8, yy - 8, xx_left + 8, yy + 8, c_black, c_black, c_black, c_black, true)
	draw_rectangle_color(xx_right - 8, yy - 8, xx_right + 8, yy + 8, c2, c2, c2, c2, false)
	draw_rectangle_color(xx_right - 8, yy - 8, xx_right + 8, yy + 8, c_black, c_black, c_black, c_black, true)
	draw_sprite_ext(sScrollArrowUp, -1, xx_left, yy, .75, .75, 0, c3, 1)
	draw_sprite_ext(sScrollArrowDown, -1, xx_right, yy, .75, .75, 0, c4, 1)
	
	//draw attribute name and value
	if(attributes.get_attr(c_attrs_keys[i]).get_value()) draw_set_color(c_yellow)
	draw_text(x + op_border + 75 + 75 * floor( i / 4 ), y + op_border +  100 + 20*(i % 4) , $"{c_attrs_keys[i]}: {character.get_attr(c_attrs_keys[i]).get_value() + attributes.get_attr(c_attrs_keys[i]).get_value()}")
	draw_set_color(c_white)
}

//draw skill interface

draw_text(x + op_border + 50, y + op_border + 225, $"Cost of skill: ")

draw_text(x + op_border + 340, y + op_border + 225, $"Total skill Cost: ")
if(total_skill_cost > party.get_gold()) draw_set_color(c_red)
draw_text(x + op_border + 535, y + op_border + 225, $"{total_skill_cost}")
draw_set_color(c_white)

var c_skills = character.get_skills().get_skills()
var c_skills_keys = []
ds_map_keys_to_array(c_skills, c_skills_keys)
for(var i = 0; i < ds_map_size(character.get_skills().get_skills()); i++)
{
	var tmp = character.get_skills().get_skills()
	//draw arrows to increase or decrease value
	var xx_left = x + op_border + 60 + 75 * floor( i / 8 )
	var xx_right = x + op_border + 190 + 75 * floor( i / 8 )
	var yy = y + op_border + 260 + 20*(i % 4)
	var c1 = c_dkgray
	var c2 = c_dkgray
	var c3 = c_white
	var c4 = c_white
	
	if(mouse_x > xx_left - 8 and mouse_x < xx_right + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
	{
		if(get_cost_of_next_skill(c_skills_keys[i]) + total_skill_cost + get_attribute_cost(0)> party.get_gold()) draw_set_color(c_red)
		draw_text(x + op_border + 260, y + op_border + 225, $"{get_cost_of_next_skill(c_skills_keys[i])}")
		draw_set_color(c_white)
	}
	if(mouse_x > xx_left - 8 and mouse_x < xx_left + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
	{
		c1 = c_ltgray
		c3 = c_yellow
	}
	if(mouse_x > xx_right - 8 and mouse_x < xx_right + 8 and mouse_y > yy - 8 and mouse_y < yy + 8)
	{
		c2 = c_ltgray
		c4 = c_yellow
	}
	draw_rectangle_color(xx_left - 8, yy - 8, xx_left + 8, yy + 8, c1, c1, c1, c1, false)
	draw_rectangle_color(xx_left - 8, yy - 8, xx_left + 8, yy + 8, c_black, c_black, c_black, c_black, true)
	draw_rectangle_color(xx_right - 8, yy - 8, xx_right + 8, yy + 8, c2, c2, c2, c2, false)
	draw_rectangle_color(xx_right - 8, yy - 8, xx_right + 8, yy + 8, c_black, c_black, c_black, c_black, true)
	draw_sprite_ext(sScrollArrowUp, -1, xx_left, yy, .75, .75, 0, c3, 1)
	draw_sprite_ext(sScrollArrowDown, -1, xx_right, yy, .75, .75, 0, c4, 1)
	draw_text(x + op_border + 75, y + op_border +  250 + 20*i, $"{ds_map_keys_to_array(tmp)[i]}: ")
	if(skills.get_skill(c_skills_keys[i]).get_value()) draw_set_color(c_yellow)
	draw_text(x + op_border + 155, y + op_border +  250 + 20*i, $"{character.get_skills().get_skill(c_skills_keys[i]).get_value() + skills.get_skill(c_skills_keys[i]).get_value()}")
	draw_set_color(c_white)
}
draw_text(x + op_border + 340, y + op_border + 425, $"Total Cost: ")
if(total_skill_cost + get_attribute_cost() > party.get_gold()) draw_set_color(c_red)
draw_text(x + op_border + 535, y + op_border + 425, $"{total_skill_cost + get_attribute_cost()}")
draw_set_color(c_white)

draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())
