/// @description Insert description here
// You can write your code in this editor
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
}