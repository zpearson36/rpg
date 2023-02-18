/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case FIGHTGUISTATES.ACTIVE:
	{
		var is_available = true
		if(fight_manager.get_character().get_ap() <= 0) is_available = false
		if(draw_button_sprite(spr_button, 1, 1, room_width - 400, 25, c_blue, c_aqua, c_white, "Move", c_white, false, is_available))		{
			fight_manager.get_character().to_move()
		}
		break;
	}
	case FIGHTGUISTATES.INACTIVE:
	{
		break;
	}
}