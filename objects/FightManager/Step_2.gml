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
		var break_case = false
		for(var k = 0; k < array_length(units); k++)
		{
			var is_pc_party = units[k][0].get_faction() == GameManager.get_player_faction()
			for(var l = 0; l < array_length(units[k]); l++)
			{
				if(units[k][l].get_state() == COMBATCHARACTERSTATES.DEAD)
					units[k] = array_delete_index(units[k], l)
			}
			if(array_length(units[k]) <= 0)
			{
				break_case = true
				if(not is_pc_party) player_wins = true
				break
			}
		}
		if(break_case) break
		var num_chars = 0
		while(units[party][character].get_ap() == 0)
		{
			character++
			num_chars++
			if(character == array_length(units[party])) character = 0
			if(num_chars == array_length(units[party]))
			{
				next_party()
				character = 0
			}
		if(array_length(units[party]) == 0) next_party()
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