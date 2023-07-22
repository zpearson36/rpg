/// @description Insert description here
// You can write your code in this editor
var cam = view_camera[0]
var cam_width = camera_get_view_width(cam)
var cam_height = camera_get_view_height(cam)
var xx = 0//camera_get_view_x(cam)
var yy = 0//camera_get_view_y(cam)
switch(state)
{
	case FIGHTGUISTATES.ACTIVE:
	{
		draw_set_font(fnt_button)
		var is_available = true
		if(fight_manager.get_character().get_ap() <= 0) is_available = false
		if(draw_button_sprite(spr_button, 1, 1, xx + cam_width - 400, 25, c_blue, c_aqua, c_white, "Move", c_white, false, is_available))		{
			fight_manager.prepare_move()
		}
		if(draw_button_sprite(spr_button, 1, 1, xx + cam_width - 400, 100, c_blue, c_aqua, c_white, "Attack", c_white, false, is_available))		{
			fight_manager.get_character().to_attack()
		}
		if(draw_button_sprite(spr_button, 1, 1, xx + cam_width - 400, yy + cam_height - 100, c_blue, c_aqua, c_white, "End Turn", c_white, false, true))		{
			fight_manager.next_party()
		}
		break;
	}
	case FIGHTGUISTATES.INACTIVE:
	{
		break;
	}
}