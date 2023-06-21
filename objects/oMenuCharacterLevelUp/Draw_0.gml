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
var c_attrs = character.get_attrs().get_attributes()
var c_attrs_keys = []
ds_map_keys_to_array(c_attrs, c_attrs_keys)
for(var i = 0; i < ds_map_size(character.get_attrs().get_attributes()); i++)
{
	
	//draw arrows to increase or decrease value
	var xx_left = x + op_border + 60 + 75 * floor( i / 4 )
	var xx_right = x + op_border + 148 + 75 * floor( i / 4 )
	var yy = y + op_border + 87 + 20*(i % 4)
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
	print(c_attrs_keys[i])
	if(attributes.get_attr(c_attrs_keys[i])) draw_set_color(c_yellow)
	draw_text(x + op_border + 75 + 75 * floor( i / 4 ), y + op_border +  75 + 20*(i % 4) , $"{c_attrs_keys[i]}: {character.get_attr(c_attrs_keys[i]) + attributes.get_attr(c_attrs_keys[i])}")
	draw_set_color(c_white)
}
for(var i = 0; i < ds_map_size(character.get_skills().get_skills()); i++)
{
	var tmp = character.get_skills().get_skills()
	draw_text(x + op_border + 75, y + op_border +  185 + 20*i, $"{ds_map_keys_to_array(tmp)[i]}: {character.get_skills().get_skill(ds_map_keys_to_array(tmp)[i]).get_value()}")
}
draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())
