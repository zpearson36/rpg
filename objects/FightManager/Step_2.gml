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
		var num_chars = 0
		while(units[party][character].get_ap() == 0)
		{
			character++
			num_chars++
			if(character == array_length(units[party])) character = 0
			if(num_chars == array_length(units[party])) next_party()
		}
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