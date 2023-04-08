/// @description Insert description here
switch(state)
{
	case FMStates.INIT:
	{
		break;
	}
	case FMStates.SETUP:
	{
		break;
	}
	case FMStates.RUNNING:
	{
		switch(units[party][character].get_state())
		{
			case COMBATCHARACTERSTATES.IDLE:
			{
				break;
			}
			case COMBATCHARACTERSTATES.MOVING:
			{
				break;
			}
			case COMBATCHARACTERSTATES.ATTACKING:
			{
				break;
			}
			case COMBATCHARACTERSTATES.DEAD:
			{
				break;
			}
		}
		break;
	}
	case FMStates.DEACTIVATING:
	{
		break;
	}
	case FMStates.INACTIVE:
	{
		break;
	}
}
