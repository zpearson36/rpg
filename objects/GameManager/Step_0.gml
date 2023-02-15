/// @description Insert description here
// You can write your code in this editor
/*
if(keyboard_check_pressed(vk_space))
{
	tmp2 = new Character()
}
if(keyboard_check_pressed(vk_enter))
{
	show_debug_message(Character.charArray[Character.charCount].charID)
}
if(mouse_check_button_pressed(mb_left))
{
	var mx = floor(mouse_x / COMBATCELLSIZE)
	var my = floor(mouse_y / COMBATCELLSIZE)
	
	grid.get_cell(mx, my).set_occupant(tmp2);
}
*/
switch(state)
{
	case GameStates.MAINMENU:
	{
		state = GameStates.WORLD
		break;
	}
	case GameStates.WORLD:
	{
		world_manager.activate(pc)
		if(keyboard_check_pressed(vk_space))
		{
			world_manager.deactivate()
			state = GameStates.COMBAT
		}
		break;
	}
	case GameStates.COMBAT:
	{
		fight_manager.activate(pc)
		if(keyboard_check_pressed(vk_space))
		{
			fight_manager.deactivate()
			state = GameStates.WORLD
		}
		break;
	}
}