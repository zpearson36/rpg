/// @description Insert description here
// You can write your code in this editor

show_debug_message("+ " + string(state))
switch(state)
{
	case WMStates.INIT:
	{
		show_debug_message(0)
		state = WMStates.SETUP;
		break;
	}
	case WMStates.SETUP:
	{
		show_debug_message(1)
		if(player != undefined) state = WMStates.RUNNING
		break;
	}
	case WMStates.RUNNING:
	{
		show_debug_message(2)
		break;
	}
	case WMStates.DEACTIVATING:
	{
		show_debug_message(3)
		instance_destroy(player)
		player = undefined
		state = WMStates.INACTIVE
		break;
	}
	case WMStates.INACTIVE:
	{
		show_debug_message("- 4")
		break;
	}
}