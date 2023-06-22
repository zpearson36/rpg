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
		for(var i = 0; i < array_length(units); i++)
		{
			if(array_length(units[i]) == 0)
			{
				state = FMStates.COMBATFINISHED
				alarm[0] = 180
				break;
			}
		}
		for(i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				grid.get_cell(i, j).set_unobstructed()
				var obstructed = collision_line((units[party][character].get_tile().get_x() + .5) * COMBATCELLSIZE, (units[party][character].get_tile().get_y() + .5) * COMBATCELLSIZE,
						        grid.get_cell(i, j).get_x() * COMBATCELLSIZE, grid.get_cell(i, j).get_y() * COMBATCELLSIZE, oWall, false, false)
				if(obstructed != noone) grid.get_cell(i, j).set_obstructed()
				if(grid.get_cell(i, j).get_occupant() != noone and grid.get_cell(i, j).get_occupant().is_dead()) grid.get_cell(i, j).set_occupant(noone)
			}
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
