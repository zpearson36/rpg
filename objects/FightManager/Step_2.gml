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
		for(i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				if(grid.get_cell(i,j).get_occupant() != noone
				   and grid.get_cell(i,j).get_occupant().get_state() == COMBATCHARACTERSTATES.DEAD)
				{
					for(var k = 0; k < array_length(units); k++)
					{
						var deadIndex = array_get_index(units[k], grid.get_cell(i,j).get_occupant())
						if(deadIndex != -1)
						{
							if(deadIndex <= character) character = max(character - 1, 0)
							if(deadIndex < 0)
							{
								state = FMStates.DEACTIVATING
								break;
							}
							units[k] = array_delete_index(units[k], deadIndex)
						
						}
					}
				}
			}
		}
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