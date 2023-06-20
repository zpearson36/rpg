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
		if(keyboard_check_pressed(vk_enter))
		{
			to_combat()
		}
		
		if(keyboard_check_pressed(vk_escape))
		{
			if(menu_manager.is_open()) menu_manager.close()
			else menu_manager.open(oMenu)
		}
		break;
	}
	case GameStates.COMBAT:
	{
		if(keyboard_check_pressed(vk_enter))
			exit_combat()
		if(fight_manager.get_state() == FMStates.INACTIVE)
			state = GameStates.WORLD
		break;
	}
}