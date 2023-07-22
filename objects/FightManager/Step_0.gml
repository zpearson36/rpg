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
		var walls        = Generate_Map(1, 40)
		var shallowwater = Generate_Map(1, 30)
		var muddy        = Generate_Map(1, 30)
		for(var i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(var j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				//if(muddy[i][j] == 1)        grid.get_cell(i, j).set_terrain(MuddyTerrain())
				//if(shallowwater[i][j] == 1) grid.get_cell(i, j).set_terrain(ShallowWaterTerrain())
				//if(deepwater[i][j] == 1)    grid.get_cell(i, j).set_terrain(DeepWaterTerrain())
				if(walls[i][j] == 1)
				{
					grid.get_cell(i, j).set_terrain(ObstructionTerrain())
					array_push(obstructions, instance_create_layer(i * COMBATCELLSIZE, j * COMBATCELLSIZE, layer, oWall))
				}
			}
		}
		for(var k = 0; k < array_length(units); k++)
		{
			for(var i = 0; i < array_length(units[k]); i++)
			{
				var xx = irandom(COMBATGRIDWIDTH - 1)
				var yy = irandom(COMBATGRIDHEIGHT - 1)
				while(grid.get_cell(xx, yy).get_occupant() != noone
				      or grid.get_cell(xx, yy).get_terrain().get_type() == TerrainType.IMPASSIBLE)
				{
					xx = irandom(COMBATGRIDWIDTH - 1)
					yy = irandom(COMBATGRIDHEIGHT - 1)
				}
				grid.get_cell(xx, yy).set_occupant(units[k][i])
				units[k][i].set_xpos(xx * COMBATCELLSIZE)
				units[k][i].set_ypos(yy * COMBATCELLSIZE)
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
					var mx = floor(mouse_x / COMBATCELLSIZE)
					var my = floor(mouse_y / COMBATCELLSIZE)
					if(mx >= 0 and my >= 0 and mx < COMBATGRIDWIDTH and my < COMBATGRIDHEIGHT)
					{
						print($"{mx}, {my}")
						var is_path_valid = calculate_path(grid.get_cell(mx,my))
						//if(is_path_valid)
						//{
							var tile_path = grid.get_cell(mx,my).get_path()
							for(i = 0; i < array_length(tile_path); i++)
							{
								calculate_path(grid.get_cell(tile_path[i][0],tile_path[i][1]))
							}
						//}
						if(mouse_check_button_pressed(mb_left) and is_path_valid)
						{
							/*var mx = floor(mouse_x / COMBATCELLSIZE)
							var my = floor(mouse_y / COMBATCELLSIZE)
							if(grid.get_cell(mx, my).get_path_cost()
											   <= units[party][character].get_ap() * units[party][character].get_attr("spd").get_value()
							   and grid.get_cell(mx,my).get_occupant() == noone
							)*/
							//{
								units[party][character].set_dest(grid.get_cell(mx, my))
								units[party][character].to_move()
							//}
						}
					}
					break; 
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					move_character(get_character())
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
						show_debug_message(1 - (chance_to_hit(get_character(), grid.get_cell(mx,my).get_occupant()) / 100))
						var hit = ch > (1 - (chance_to_hit(get_character(), grid.get_cell(mx,my).get_occupant())  / 100))
						if(grid.get_cell(mx,my).get_occupant() != noone and not grid.get_cell(mx,my).is_obstructed()
						   and FactionManager.get_relation(grid.get_cell(mx,my).get_occupant().get_faction(),
						                                   get_character().get_faction()) < 0
						)
						{
							if(hit) grid.get_cell(mx,my).get_occupant().damage(get_character().get_damage())
							get_character().empty_ap()
							get_character().to_idle()
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
					prepare_move(true)
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
					if(units[party][character].get_tile() == units[party][character].get_dest()) units[party][character].to_attack()
					else units[party][character].to_move()
					break;
				}
				case COMBATCHARACTERSTATES.MOVING:
				{
					move_character(get_character())
					break;
				}
				case COMBATCHARACTERSTATES.ATTACKING:
				{
					var ch = random(1)
					print("Attack!")
					var hit = ch > (1 - (chance_to_hit(units[party][character], units[party][character].get_targ()) / 100))
					if(hit) units[party][character].get_targ().damage(get_character().get_damage())
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
		for(var i = 0; i < array_length(units); i++)
		{
			for(var j = 0; j < array_length(units[i]); j++)
			{
				instance_destroy(units[i][j])
			}
			
			array_delete(units[i], 0, array_length(units[i]))
		}
		array_delete(units, 0, array_length(units))
		for(var i = 0; i < array_length(obstructions); i++)
		{
			instance_destroy(obstructions[i])
		}
		array_delete(obstructions, 0, array_length(obstructions))
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
