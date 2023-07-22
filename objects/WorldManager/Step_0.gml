switch(state)
{
	case WMStates.INIT:
	{
		with(oStall)
		{
			activate()
		}
		state = WMStates.SETUP;
		break;
	}
	case WMStates.SETUP:
	{
		if(player != undefined)
		{
			state = WMStates.RUNNING
		}
		break;
	}
	case WMStates.RUNNING:
	{
		var xx = camera_get_view_x(view_camera[0])
		var yy = camera_get_view_y(view_camera[0])
		xx = max(0, player.get_char().get_x() - camera_get_view_width(view_camera[0]) / 2) + 32
		xx = min(xx, room_width - camera_get_view_width(view_camera[0]))
		yy = max(0, player.get_char().get_y() - camera_get_view_height(view_camera[0]) / 2) + 32
		yy = min(yy, room_height - camera_get_view_height(view_camera[0]))
		camera_set_view_pos(view_camera[0], xx, yy)
		break;
	}
	case WMStates.DEACTIVATING:
	{
		with(oStall)
		{
			deactivate()
		}
		instance_destroy(player)
		player = undefined
		state = WMStates.INACTIVE
		break;
	}
	case WMStates.INACTIVE:
	{
		break;
	}
}