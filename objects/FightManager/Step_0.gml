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
		break;
	}
	case FMStates.RUNNING:
	{
		
		//Logic for player control
		if(get_character().get_faction() == GameManager.player_faction)
		{
			/*print(
			    sqrt(sqr(get_character().get_tile().get_x() - floor(mouse_x / COMBATCELLSIZE)) +
				    sqr(get_character().get_tile().get_y() - floor(mouse_y / COMBATCELLSIZE)))
				)*/
			/*print(get_character().get_weapon().hit_chance(sqrt(sqr(get_character().get_tile().get_x() - floor(mouse_x / COMBATCELLSIZE)) +
				    sqr(get_character().get_tile().get_y() - floor(mouse_y / COMBATCELLSIZE)))))*/
			switch(get_character().get_state())
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
						get_character().to_idle()
						break;
					}
					var mx = floor(mouse_x / COMBATCELLSIZE)
					var my = floor(mouse_y / COMBATCELLSIZE)
					if(mx >= 0 and my >= 0 and mx < COMBATGRIDWIDTH and my < COMBATGRIDHEIGHT)
					{
						var is_path_valid = calculate_path(grid.get_cell(mx,my))
						var tile_path = grid.get_cell(mx,my).get_path()
						for(i = 0; i < array_length(tile_path); i++)
						{
							calculate_path(grid.get_cell(tile_path[i][0],tile_path[i][1]))
						}
						if(mouse_check_button_pressed(mb_left) and is_path_valid)
						{
							get_character().set_dest(grid.get_cell(mx, my))
							get_character().to_move()
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
						get_character().to_idle()
						break;
					}
					if(mouse_check_button_pressed(mb_left))
					{
						var mx = floor(mouse_x / COMBATCELLSIZE)
						var my = floor(mouse_y / COMBATCELLSIZE)
						var ch = random(1)
						var hit = ch > (1 - (get_character().get_hit_chance(grid.get_cell(mx,my).get_occupant()) / 100))
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
			switch(get_character().get_state())
			{
				case COMBATCHARACTERSTATES.IDLE:
				{
					print("TO IDLE")
					prepare_move(true)
					var action_grid = generate_action_grid(get_character(), grid)
					var action_array = []
					var tile_targ = undefined
					for(var i = 0; i < COMBATGRIDWIDTH; i++)
					{
						for(var j = 0; j < COMBATGRIDHEIGHT; j++)
						{
							action_array[i][j] = action_grid[# i, j][0]
							if(action_array[i][j] != noone)
							{
								if(tile_targ == undefined) tile_targ = [[i, j], action_grid[# i, j][0]]
								else if(action_grid[# i, j][1] > action_grid[# tile_targ[0][0], tile_targ[0][1]][1]) tile_targ = [[i, j], action_grid[# i, j][0]]
							}
						}
					}
					//AI change states
					get_character().set_targ(tile_targ[1])
					get_character().set_dest(grid.get_cell(tile_targ[0][0],tile_targ[0][1]))
					//print(action_grid)
					if(get_character().get_tile() == get_character().get_dest()) get_character().to_attack()
					else get_character().to_move()
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
					var hit = ch > (1 - (get_character().get_hit_chance(get_character().get_targ()) / 100))//chance_to_hit(get_character(), get_character().get_targ()) / 100))
					if(hit) get_character().get_targ().damage(get_character().get_damage())
					get_character().empty_ap()
					get_character().to_idle()
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
		camera_set_view_pos(view_camera[0], 0, 0)
		camera_set_view_size(view_camera[0], 1024, 1024)
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
		if(player_wins)
		    GameManager.get_player_party().add_gold(reward)
        player_wins = false
		state = FMStates.INACTIVE
		break;
	}
	case FMStates.INACTIVE:
	{
		break;
	}
}
