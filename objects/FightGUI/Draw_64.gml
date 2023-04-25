/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case FIGHTGUISTATES.ACTIVE:
	{
		draw_set_font(fnt_button)
		var is_available = true
		if(fight_manager.get_character().get_ap() <= 0) is_available = false
		if(draw_button_sprite(spr_button, 1, 1, room_width - 400, 25, c_blue, c_aqua, c_white, "Move", c_white, false, is_available))		{
			fight_manager.get_character().to_move()
		}
		if(draw_button_sprite(spr_button, 1, 1, room_width - 400, 100, c_blue, c_aqua, c_white, "Attack", c_white, false, is_available))		{
			fight_manager.get_character().to_attack()
		}
		if(draw_button_sprite(spr_button, 1, 1, room_width - 400, room_height - 100, c_blue, c_aqua, c_white, "End Turn", c_white, false, true))		{
			fight_manager.next_party()
		}
		break;
	}
	case FIGHTGUISTATES.INACTIVE:
	{
		break;
	}
}