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
		var cw = camera_get_view_width(view_camera[0])
		var ch = camera_get_view_height(view_camera[0])
		if(mouse_wheel_down())
		{
			cw = min(cw + 512, 2048)
			ch = min(ch + 512, 2048)
		}
		if(mouse_wheel_up())
		{
			cw = max(cw - 512, 1024)
			ch = max(ch - 512, 1024)
		}
		camera_set_view_size(view_camera[0], cw, ch)
		/*
		if(keyboard_check(ord("A"))) xx = max(0, xx - cam_speed)
		if(keyboard_check(ord("D"))) xx = min(room_width - camera_get_view_width(view_camera[0]), xx + cam_speed)
		if(keyboard_check(ord("W"))) yy = max(0, yy - cam_speed)
		if(keyboard_check(ord("S"))) yy = min(room_height - camera_get_view_height(view_camera[0]), yy + cam_speed)
		*/
		if(keyboard_check(ord("A"))) xx -= cam_speed// max(0, xx - cam_speed)
		if(keyboard_check(ord("D"))) xx += cam_speed//min(room_width - camera_get_view_width(view_camera[0]), xx + cam_speed)
		if(keyboard_check(ord("W"))) yy -= cam_speed//max(0, yy - cam_speed)
		if(keyboard_check(ord("S"))) yy += cam_speed// min(room_height - camera_get_view_height(view_camera[0]), yy + cam_speed)
		//xx = max(0, xx)
		//xx = min(room_width - camera_get_view_width(view_camera[0]), xx)
		xx = clamp(xx, 0, room_width - camera_get_view_width(view_camera[0]))
		yy = clamp(yy, 0, room_width - camera_get_view_height(view_camera[0]))
		camera_set_view_pos(view_camera[0], xx, yy)
		
		//transition back to world
		if(fight_manager.get_state() == FMStates.INACTIVE)
			state = GameStates.WORLD
		break;
	}
}
