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
		for(var k = 0; k < array_length(units); k++)
		{
			for(var i = 0; i < array_length(units[k]); i++)
			{
				var xx = irandom(COMBATGRIDWIDTH - 1)
				var yy = irandom(COMBATGRIDHEIGHT - 1)
				while(grid.get_cell(xx, yy).get_occupant() != noone)
				{
					xx = irandom(COMBATGRIDWIDTH - 1)
					yy = irandom(COMBATGRIDHEIGHT - 1)
				}
				grid.get_cell(xx, yy).set_occupant(units[k][i])
			}
		}
		
		state = FMStates.RUNNING
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
		//Logic for player control
		if(units[party][character].get_faction() == GameManager.player_faction)
		{
			switch(units[party][character].get_state())
			{
				case COMBATCHARACTERSTATES.IDLE:
				{
					gui.activateGUI(self)
				
					if(keyboard_check_pressed(vk_tab))
					{
						character++;
						if(character == array_length(units[party])) character = 0
					}
					break;
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					gui.deactivateGUI()
					if(mouse_check_button_pressed(mb_right))
					{
						units[party][character].to_idle()
						break;
					}
					if(mouse_check_button_pressed(mb_left))
					{
						var mx = floor(mouse_x / COMBATCELLSIZE)
						var my = floor(mouse_y / COMBATCELLSIZE)
						if(dist_to_targ(
						                  units[party][character].get_tile(),
										  grid.get_cell(mx, my)
										  ) <= units[party][character].get_ap() * units[party][character].get_attr("spd")
						   and grid.get_cell(mx,my).get_occupant() == noone
						)
						{
							repeat(ceil(dist_to_targ(
						                  units[party][character].get_tile(),
										  grid.get_cell(mx, my)
										  ) / units[party][character].get_attr("spd")))
						    {units[party][character].spend_ap();}
							grid.get_cell(mx, my).set_occupant(units[party][character]);
							units[party][character].to_idle()
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
						units[party][character].to_idle()
						break;
					}
					if(mouse_check_button_pressed(mb_left))
					{
						var mx = floor(mouse_x / COMBATCELLSIZE)
						var my = floor(mouse_y / COMBATCELLSIZE)
						var dist = dist_to_targ(
						                  units[party][character].get_tile(),
										  grid.get_cell(mx, my)
										  )
						if(dist <= units[party][character].get_attack_range_max()
						   and dist >= units[party][character].get_attack_range_min()
						   and grid.get_cell(mx,my).get_occupant() != noone
						   and FactionManager.get_relation(grid.get_cell(mx,my).get_occupant().get_faction(),
						                                   units[party][character].get_faction()) < 0
						)
						{
							grid.get_cell(mx,my).get_occupant().damage()
							units[party][character].empty_ap()
							units[party][character].to_idle()
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
		}
		//logic for AI control
		else
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
		}
		break;
	}
	case FMStates.COMBATFINISHED:
	{
		gui.deactivateGUI()
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
