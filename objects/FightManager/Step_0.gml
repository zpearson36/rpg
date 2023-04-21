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
						var ch = random(1)
						show_debug_message(ch)
						show_debug_message(1 - chance_to_hit(units[party][character], grid.get_cell(mx,my).get_occupant()))
						var hit = ch > (1 - chance_to_hit(units[party][character], grid.get_cell(mx,my).get_occupant()))
						if(grid.get_cell(mx,my).get_occupant() != noone
						   and FactionManager.get_relation(grid.get_cell(mx,my).get_occupant().get_faction(),
						                                   units[party][character].get_faction()) < 0
						)
						{
							if(hit) grid.get_cell(mx,my).get_occupant().damage()
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
					var action_grid = generate_action_grid(units[party][character], grid)
					var action_array = []
					var tile_targ = undefined
					for(var i = 0; i < COMBATGRIDWIDTH; i++)
					{
						for(var j = 0; j < COMBATGRIDHEIGHT; j++)
						{
							action_array[i][j] = action_grid[# i, j][1]
							if(action_grid[# i, j] != noone)
							{
								if(tile_targ == undefined) tile_targ = [[i, j], action_grid[# i, j][0]]
								else if(action_grid[# i, j][1] > action_grid[# tile_targ[0][0], tile_targ[0][1]][1]) tile_targ = [[i, j], action_grid[# i, j][0]]
							}
						}
					}
					
					for(var i = 0; i < COMBATGRIDWIDTH; i++)
					{
						print(action_array[i])
					}
					print(tile_targ[0][0])
					print(tile_targ[0][1])
					print(action_grid[# tile_targ[0][0], tile_targ[0][1]][1])
					print(tile_targ[1])
					units[party][character].set_targ(tile_targ[1])
					units[party][character].set_dest(grid.get_cell(tile_targ[0][0],tile_targ[0][1]))
					
					if(units[party][character].get_tile() == units[party][character].get_dest()) units[party][character].to_attack()
					else units[party][character].to_move()
					break;
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					repeat(ceil(dist_to_targ(
						            units[party][character].get_tile(),
									units[party][character].get_dest()
									) / units[party][character].get_attr("spd")))
					{units[party][character].spend_ap();}
					units[party][character].get_dest().set_occupant(units[party][character]);
					units[party][character].to_idle()
				//	show_debug_message("IS MOVING")
					break;
				}
				case COMBATCHARACTERSTATES.ATTACKING:
				{
					var ch = random(1)
					//print(units[party][character].get_targ())
					var hit = ch > (1 - chance_to_hit(units[party][character], units[party][character].get_targ()))
					if(hit) units[party][character].get_targ().damage()
					units[party][character].empty_ap()
					units[party][character].to_idle()
					show_debug_message("IS ATTACKING")
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
