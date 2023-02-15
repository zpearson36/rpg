/// @description Insert description here
switch(state)
{
	case FMStates.INIT:
	{
		state = FMStates.SETUP;
		break;
	}
	case FMStates.SETUP:
	{
		grid = new CombatGrid()
		grid.init()
		grid.get_cell(irandom(COMBATGRIDWIDTH - 1), irandom(COMBATGRIDHEIGHT - 1)).set_occupant(character)
		state = FMStates.RUNNING
		break;
	}
	case FMStates.RUNNING:
	{
		if(mouse_check_button_pressed(mb_left))
		{
			var mx = floor(mouse_x / COMBATCELLSIZE)
			var my = floor(mouse_y / COMBATCELLSIZE)
	
			grid.get_cell(mx, my).set_occupant(character);
		}
		break;
	}
	case FMStates.DEACTIVATING:
	{
		delete character
		delete grid
		character = undefined
		grid = undefined
		state = FMStates.INACTIVE
		break;
	}
	case FMStates.INACTIVE:
	{
		break;
	}
}
