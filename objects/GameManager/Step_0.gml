show_debug_message(array_length(pc_party.get_members()))
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
		fight_manager.activate(pc_party.get_members())
		if(keyboard_check_pressed(vk_space))
		{
			fight_manager.deactivate()
			state = GameStates.WORLD
		}
		break;
	}
}