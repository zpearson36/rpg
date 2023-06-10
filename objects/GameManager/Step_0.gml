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
			menu_manager.close()
			world_manager.deactivate()
			state = GameStates.COMBAT
			fight_manager.activate(pc_party.get_members(), enemy_party.get_members())
		}
		
		if(keyboard_check_pressed(vk_escape))
		{
			if(menu_manager.is_open()) menu_manager.close()
			else menu_manager.open()
		}
		break;
	}
	case GameStates.COMBAT:
	{
		if(keyboard_check_pressed(vk_space))
		{
			fight_manager.deactivate()
			state = GameStates.WORLD
		}
		if(fight_manager.get_state() == FMStates.INACTIVE)
			state = GameStates.WORLD
		break;
	}
}