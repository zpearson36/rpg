/// @description Insert description here
show_debug_message(array_length(units))
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
		for(var i = 0; i < array_length(units); i++)
		{
			var xx = irandom(COMBATGRIDWIDTH - 1)
			var yy = irandom(COMBATGRIDHEIGHT - 1)
			while(grid.get_cell(xx, yy).get_occupant() != noone)
			{
				xx = irandom(COMBATGRIDWIDTH - 1)
				yy = irandom(COMBATGRIDHEIGHT - 1)
			}
			grid.get_cell(xx, yy).set_occupant(units[i])
		}
		
		state = FMStates.RUNNING
		break;
	}
	case FMStates.RUNNING:
	{
		if(mouse_check_button_pressed(mb_left))
		{
			var mx = floor(mouse_x / COMBATCELLSIZE)
			var my = floor(mouse_y / COMBATCELLSIZE)
			show_debug_message(string(mx) + ", " + string(my))
			if(point_distance(mx, my,
						  	  units[character].get_tile().get_x(),
							  units[character].get_tile().get_y()
							  ) <= units[character].get_ap() * units[character].get_attr("spd")
			   and grid.get_cell(mx,my).get_occupant() == noone
			)
			{
				repeat(ceil(point_distance(mx, my,
						  	  units[character].get_tile().get_x(),
							  units[character].get_tile().get_y()
							  ) / units[character].get_attr("spd")))
			    {units[character].spend_ap();}
				grid.get_cell(mx, my).set_occupant(units[character]);
			}
		}
		if(keyboard_check_pressed(vk_tab))
		{
			character++;
			if(character == array_length(units)) character = 0
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
