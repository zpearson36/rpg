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
		
		if(keyboard_check_pressed(vk_escape))
		{
			if(menu_manager.is_open()) menu_manager.close()
			else menu_manager.open(oMenu)
		}
		break;
	}
	case GameStates.COMBAT:
	{
		// Camera Controls for combat
		var cam_speed = 15
		var xx = camera_get_view_x(view_camera[0])
		var yy = camera_get_view_y(view_camera[0])
		if(keyboard_check(ord("A"))) xx = max(0, xx - cam_speed)
		if(keyboard_check(ord("D"))) xx = min(room_width - camera_get_view_width(view_camera[0]), xx + cam_speed)
		if(keyboard_check(ord("W"))) yy = max(0, yy - cam_speed)
		if(keyboard_check(ord("S"))) yy = min(room_height - camera_get_view_height(view_camera[0]), yy + cam_speed)
		camera_set_view_pos(view_camera[0], xx, yy)
		
		//transition back to world
		if(fight_manager.get_state() == FMStates.INACTIVE)
			state = GameStates.WORLD
		break;
	}
}
