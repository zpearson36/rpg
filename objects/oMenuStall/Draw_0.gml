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
	if(currently_selected == i and side_menu) draw_set_color(c_yellow)
	draw_text(x + w + op_border, y + op_border + op_space*i, options[i][0])
	draw_set_color(c_white)
}

draw_text(x + w + op_border, y + height + op_border, "Gold:")
draw_text(x + w + op_border, y + height + op_border + op_space, party.get_gold())