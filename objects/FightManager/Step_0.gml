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
		var deepwater    = Generate_Map(1, 30)
		var shallowwater = Generate_Map(1, 30)
		var muddy        = Generate_Map(1, 30)
		for(var i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(var j = 0; j < COMBATGRIDWIDTH; j++)
			{
				if(muddy[i][j] == 1)        grid.get_cell(i, j).set_terrain(MuddyTerrain())
				if(shallowwater[i][j] == 1) grid.get_cell(i, j).set_terrain(ShallowWaterTerrain())
				if(deepwater[i][j] == 1)    grid.get_cell(i, j).set_terrain(DeepWaterTerrain())
			}
		}
		for(var k = 0; k < array_length(units); k++)
		{
			for(var i = 0; i < array_length(units[k]); i++)
			{
				var xx = irandom(COMBATGRIDWIDTH - 1)
				var yy = irandom(COMBATGRIDHEIGHT - 1)
				while(grid.get_cell(xx, yy).get_occupant() != noone
				      or grid.get_cell(xx, yy).get_terrain().get_type() == TerrainType.DEEPWATER)
				{
					xx = irandom(COMBATGRIDWIDTH - 1)
					yy = irandom(COMBATGRIDHEIGHT - 1)
				}
				print(grid.get_cell(xx, yy).get_terrain().get_type())
				grid.get_cell(xx, yy).set_occupant(units[k][i])
			}
		}
		state = FMStates.RUNNING
		break;
	}
	case FMStates.RUNNING:
	{
		
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
				case COMBATCHARACTERSTATES.INITIATE_MOVE:
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
						if(grid.get_cell(mx, my).get_path_cost()
										   <= units[party][character].get_ap() * units[party][character].get_attr("spd")
						   and grid.get_cell(mx,my).get_occupant() == noone
						)
						{
							units[party][character].set_dest(grid.get_cell(mx, my))
							units[party][character].to_move()
						}
					}
					break; 
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					repeat(ceil(units[party][character].get_dest().get_path_cost()
					               / units[party][character].get_attr("spd")))
					{units[party][character].spend_ap();}
					units[party][character].get_dest().set_occupant(units[party][character]);
					units[party][character].to_idle()
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
					print("TO IDLE")
					prepare_move()
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
					
					units[party][character].set_targ(tile_targ[1])
					units[party][character].set_dest(grid.get_cell(tile_targ[0][0],tile_targ[0][1]))
					print(string(tile_targ[0][0]) + ", " + string(tile_targ[0][1]) + ": " + string(grid.get_cell(tile_targ[0][0],tile_targ[0][1]).get_path_cost()))
					if(units[party][character].get_tile() == units[party][character].get_dest()) units[party][character].to_attack()
					else units[party][character].to_move()
					break;
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					//print(units[party][character].get_dest().get_x())
					//print(units[party][character].get_dest().get_y())
					//print(units[party][character].get_ap());
					repeat(ceil(units[party][character].get_dest().get_path_cost()
					               / units[party][character].get_attr("spd")))
					{units[party][character].spend_ap();}
					units[party][character].get_dest().set_occupant(units[party][character]);
					units[party][character].to_idle()
					break;
				}
				case COMBATCHARACTERSTATES.ATTACKING:
				{
					var ch = random(1)
					print("Attack!")
					var hit = ch > (1 - chance_to_hit(units[party][character], units[party][character].get_targ()))
					if(hit) units[party][character].get_targ().damage()
					units[party][character].empty_ap()
					units[party][character].to_idle()
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
