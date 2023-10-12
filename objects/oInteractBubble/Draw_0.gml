/// @description Insert description here
// You can write your code in this editor
if(display)
{
	draw_set_color(c_black)
	draw_rectangle(x - 128, y - 5, x + 256, y - 55, true)
	draw_set_alpha(.5)
	draw_rectangle(x - 128, y - 5, x + 256, y - 55, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	draw_set_font(fnt_prompt)
	draw_text(x - 110, y - 35, "Press <SPACE> to Interact")
	draw_set_font(-1)
}