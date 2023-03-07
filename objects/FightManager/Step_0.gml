/// @description Insert description here
switch(state)
{
	case FMStates.INIT:
	{
		//gui.activateGUI(self)
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
		switch(units[character].get_state())
		{
			case COMBATCHARACTERSTATES.IDLE:
			{
				gui.activateGUI(self)
				
				if(keyboard_check_pressed(vk_tab))
				{
					character++;
					if(character == array_length(units)) character = 0
				}
				break;
			}
			case COMBATCHARACTERSTATES.MOVING:
			{
				gui.deactivateGUI()
				if(mouse_check_button_pressed(mb_right))
				{
					units[character].to_idle()
					break;
				}
				if(mouse_check_button_pressed(mb_left))
				{
					var mx = floor(mouse_x / COMBATCELLSIZE)
					var my = floor(mouse_y / COMBATCELLSIZE)
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
						units[character].to_idle()
						break;
					}
				}
				break;
			}
			case COMBATCHARACTERSTATES.ATTACKING:
			{
				gui.deactivateGUI()
				if(mouse_check_button_pressed(mb_right))
				{
					units[character].to_idle()
					break;
				}
				if(mouse_check_button_pressed(mb_left))
				{
					var mx = floor(mouse_x / COMBATCELLSIZE)
					var my = floor(mouse_y / COMBATCELLSIZE)
					var dist = point_distance(mx, my,
								  	  units[character].get_tile().get_x(),
									  units[character].get_tile().get_y()
									  )
					if(dist <= units[character].get_attack_range_max()
					   and dist >= units[character].get_attack_range_min()
					   and grid.get_cell(mx,my).get_occupant() != noone
					)
					{
						grid.get_cell(mx,my).get_occupant().damage()
						units[character].empty_ap()
						units[character].to_idle()
						break;
					}
				}
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
		array_delete(units, 0, array_length(units))
		delete grid
		character = undefined
		grid = undefined
		gui.deactivateGUI()
		state = FMStates.INACTIVE
		break;
	}
	case FMStates.INACTIVE:
	{
		break;
	}
}
