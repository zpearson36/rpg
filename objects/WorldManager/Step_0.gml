switch(state)
{
	case WMStates.INIT:
	{
		state = WMStates.SETUP;
		break;
	}
	case WMStates.SETUP:
	{
		if(player != undefined) state = WMStates.RUNNING
		break;
	}
	case WMStates.RUNNING:
	{
		break;
	}
	case WMStates.DEACTIVATING:
	{
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