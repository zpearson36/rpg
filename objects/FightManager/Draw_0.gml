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
				var c_color = c_white
				draw_sprite(sDirt, 4, i * COMBATCELLSIZE, j * COMBATCELLSIZE)
				// Commented out code intended to add grass in a visually consistent way
				/*if(grass[i][j] == 1)
				{
					var sprite_name = sArmourNone
					var sprite_ind = -1
					var dir_array = [[-1, -1], [ 0, -1], [ 1, -1],
	                                 [-1,  0], [ 0,  0], [ 1,  0],
					                 [-1,  1], [ 0,  1], [ 1,  1]]
					
					var prime_array = [17,  3, 19,
					                    7,  0, 11,
									   23, 13, 29]
									   
					var cardinal_array = [1, 3, 5, 7]
					var unique_val = 0
					for(var k = 0; k < array_length(cardinal_array); k++)
					{
						var xx = i + dir_array[cardinal_array[k]][0]
						var yy = j + dir_array[cardinal_array[k]][1]
						if(xx >= 0 and xx < COMBATGRIDWIDTH and yy >= 0 and yy < COMBATGRIDHEIGHT)
						    unique_val += grass[xx][yy] * prime_array[cardinal_array[k]]
					}
					
					//var unique_val = top + left + right + bottom
					
					switch(unique_val)
					{
						// First 5 cases are fall through as each results in the same sprite
						case 0:
						{
							sprite_name = sGrass3
							sprite_ind = -1
							break;
						}
						case 3:
						{
							sprite_name = sGrass4
							sprite_ind = 3
							break;
						}
						case 7:
						{
							sprite_name = sGrass4
							sprite_ind = 2
							break;
						}
						case 11:
						{
							sprite_name = sGrass4
							sprite_ind = 1
							break;
						}
						case 13:
						{
							sprite_name = sGrass4
							sprite_ind = 0
							break;
						}
						case 16:
						{
							sprite_name = sGrass4
							sprite_ind = 22
							break;
						}
						case 18:
						{
							sprite_name = sGrass4
							sprite_ind = 23
							break;
						}
						case 10:
						{
							sprite_name = sGrass1
							sprite_ind = 8
							break;
						}
						case 14:
						{
							sprite_name = sGrass1
							sprite_ind = 6
							break;
						}
						case 20:
						{
							sprite_name = sGrass1
							sprite_ind = 2
							break;
						}
						case 24:
						{
							sprite_name = sGrass1
							sprite_ind = 0
							break;
						}
						case 21:
						{
							sprite_name = sGrass1
							sprite_ind = 7
							break;
						}
						case 23:
						{
							sprite_name = sGrass1
							sprite_ind = 5
							break;
						}
						case 27:
						{
							sprite_name = sGrass1
							sprite_ind = 3
							break;
						}
						case 31:
						{
							sprite_name = sGrass1
							sprite_ind = 1
							break;
						}
						case 34:
						{
							var diagonal_array = [0, 2, 6, 8]
							unique_val = 0
							for(var k = 0; k < array_length(diagonal_array); k++)
							{
								var xx = i + dir_array[diagonal_array[k]][0]
								var yy = j + dir_array[diagonal_array[k]][1]
								if(xx >= 0 and xx < COMBATGRIDWIDTH and yy >= 0 and yy < COMBATGRIDHEIGHT)
								    unique_val += grass[xx][yy] * prime_array[diagonal_array[k]]
							}
							
							switch(unique_val)
							{
								case 0:
								{
									sprite_name = sGrass1
									sprite_ind = 8
									break;
								}
								case 17:
								{
									sprite_name = sGrass4
									sprite_ind = 5
									break;
								}
								case 19:
								{
									sprite_name = sGrass4
									sprite_ind = 6
									break;
								}
								case 23:
								{
									sprite_name = sGrass4
									sprite_ind = 4
									break;
								}
								case 29:
								{
									sprite_name = sGrass4
									sprite_ind = 7
									break;
								}
								case 36:
								{
									sprite_name = sGrass4
									sprite_ind = 21
									break;
								}
								case 40:
								{
									sprite_name = sGrass4
									sprite_ind = 18
									break;
								}
								case 46:
								{
									sprite_name = sGrass4
									sprite_ind = 17
									break;
								}
								case 42:
								{
									sprite_name = sGrass4
									sprite_ind = 16
									break;
								}
								case 48:
								{
									sprite_name = sGrass1
									sprite_ind = 19
									break
								}
								case 52:
								{
									sprite_name = sGrass1
									sprite_ind = 20
									break;
								}
								case 59:
								{
									sprite_name = sGrass2
									sprite_ind = 0
									break;
								}
								case 65:
								{
									sprite_name = sGrass2
									sprite_ind = 1
									break;
								}
								case 69:
								{
									sprite_name = sGrass2
									sprite_ind = 2
									break;
								}
								case 71:
								{
									sprite_name = sGrass2
									sprite_ind = 3
									break;
								}
								case 88:
								{
									sprite_name = sGrass1
									sprite_ind = 4
									break;
								}
							}
							break;
						}
						default:
						{
							sprite_name = sTileObstruction
							sprite_ind = -1
							break;
						}
					}
					
					
					
					//draw_sprite(sprite_name, sprite_ind, i * COMBATCELLSIZE, j * COMBATCELLSIZE)
				}*/
				
				draw_sprite(grid.get_cell(i, j).get_terrain().get_sprite(), -1, i * COMBATCELLSIZE, j * COMBATCELLSIZE)
				draw_set_color(c_black)
				if(not grid.get_cell(i, j).is_discovered()) draw_rectangle(i * COMBATCELLSIZE, j * COMBATCELLSIZE, (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE, false)
				draw_set_alpha(.5)
				if(not grid.get_cell(i, j).is_observed()) draw_rectangle(i * COMBATCELLSIZE, j * COMBATCELLSIZE, (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE, false)
				draw_set_alpha(1)
				draw_set_color(c_white)

			}
		}
		
		for(var i = 0; i < array_length(units); i++)
		{
			for(var j = 0; j < array_length(units[i]); j++)
			{
				if(units[i][j].get_tile().is_observed() || units[i][j].get_faction().get_id() == GameManager.get_player_faction().get_id())
				{
					// Draw Character and Equipment
					draw_sprite(units[i][j].get_sprite(),
					       OFFSET_MULTIPLIER * 
							    (units[i][j].get_character().get_char_action() + units[i][j].get_character().get_facing())
								+ units[i][j].get_character().get_frame(),
					       units[i][j].get_xpos(), units[i][j].get_ypos())
					draw_sprite(units[i][j].get_armour().get_sprite(), -1,
					       units[i][j].get_xpos(), units[i][j].get_ypos())
					draw_sprite(units[i][j].get_weapon().get_sprite(), -1,
					       units[i][j].get_xpos(), units[i][j].get_ypos())
						   
					// Draw Health Bar
					draw_healthbar(units[i][j].get_xpos(), units[i][j].get_ypos() - 14, units[i][j].get_xpos() + 64, units[i][j].get_ypos() - 6,
					               (units[i][j].get_hp()/units[i][j].get_hp_max()) * 100, c_gray, c_red, c_green,0,true,true)
				}
				
				// Draw Action Points if Currently Selected
				if(i == party and j == character and units[i][j].get_faction().get_id() == GameManager.get_player_faction().get_id())
				{
					for(var k = 0; k < units[i][j].get_ap_max(); k++)
					{
						var sprt = sAPSpent
						if(units[i][j].get_ap() > k) sprt = sAPAvailable
						draw_sprite(sprt, -1, units[i][j].get_xpos() + (16*k), units[i][j].get_ypos() - 32)
					}
				}
			}
		}
		
		switch(get_character().get_state())
		{
			case COMBATCHARACTERSTATES.IDLE:
			{
				break;
			}
			case COMBATCHARACTERSTATES.INITIATE_MOVE:
			{
				draw_set_alpha(.3)
				var mx = floor(mouse_x / COMBATCELLSIZE)
				var my = floor(mouse_y / COMBATCELLSIZE)
				if(mx >= 0 and my >= 0 and mx < COMBATGRIDWIDTH and my < COMBATGRIDHEIGHT)
				{
					var tile = grid.get_cell(mx,my)
					var tile_path = tile.get_path()
					for(i = 0; i < array_length(tile_path); i++)
					{
						var c_color = c_blue
						if(grid.get_cell(tile_path[i][0],tile_path[i][1]).get_path_cost() > get_character().get_attr("spd").get_value()) c_color = c_yellow
						if(grid.get_cell(tile_path[i][0],tile_path[i][1]).get_path_cost() > get_character().get_attr("spd").get_value() * get_character().get_ap()) c_color = c_red
						draw_rectangle_color(tile_path[i][0] * COMBATCELLSIZE, tile_path[i][1] * COMBATCELLSIZE,
											(tile_path[i][0] + 1) * COMBATCELLSIZE, (tile_path[i][1] + 1) * COMBATCELLSIZE,
											c_color, c_color, c_color, c_color, false);
					
						draw_text(tile_path[i][0] * COMBATCELLSIZE, tile_path[i][1] * COMBATCELLSIZE,grid.get_cell(tile_path[i][0],tile_path[i][1]).get_path_cost())
					}
				}
				draw_set_alpha(1)
				break;
			}
			case COMBATCHARACTERSTATES.ATTACKING:
			{
				for(i = 0; i < COMBATGRIDWIDTH; i++)
				{
					for(j = 0; j < COMBATGRIDHEIGHT; j++)
					{
						draw_set_font(fnt_hitchance)
						var mx = floor(mouse_x / COMBATCELLSIZE)
						var my = floor(mouse_y / COMBATCELLSIZE)
						
						/*draw_line(get_character().get_tile().get_x() * COMBATCELLSIZE, get_character().get_tile().get_y() * COMBATCELLSIZE,
						    grid.get_cell(i, j).get_x() * COMBATCELLSIZE, grid.get_cell(i, j).get_y() * COMBATCELLSIZE)*/
						if(mx >= 0 and mx < COMBATGRIDWIDTH and my >= 0 and my < COMBATGRIDHEIGHT
						           and grid.get_cell(mx,my).get_occupant() != noone)
								draw_text_color(mx * COMBATCELLSIZE, my * COMBATCELLSIZE,
								string(get_character().get_hit_chance(grid.get_cell(mx,my).get_occupant())) + "%",
								c_black, c_black, c_black, c_black, 1)
						var dist = dist_to_targ(
								            get_character().get_tile(),
											grid.get_cell(i, j)
											)
						if(get_character().get_weapon().hit_chance(dist) > 0
						    and not grid.get_cell(i, j).is_obstructed())
						{
							var c_color = c_red
							var to_draw = true
							//if(not grid.get_cell(i, j).is_observed()) print(i)//to_draw = false
							//print(grid.get_cell(i, j).is_obstructed())
							if(grid.get_cell(i,j).get_occupant() != noone)
							{
								var fac1 = grid.get_cell(i,j).get_occupant().get_faction()
								var fac2 = get_character().get_faction()
								
								if(FactionManager.get_relation(fac1, fac2) < 0) c_color = c_lime
								else to_draw = false
							}
							
							draw_set_alpha(.3)
							if(to_draw) draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
								            (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_color, c_color, c_color, c_color, false);
											
							draw_set_alpha(1)
						}
					}
				}
				break;
			}
		}
		if(get_character().get_faction() != GameManager.player_faction)
		{
			draw_set_color(c_red)
			draw_set_font(fnt_prompt)
			draw_set_font(-1)
			draw_set_color(c_white)
		}
		break;
	}
	case FMStates.COMBATFINISHED:
	{
		draw_rectangle_color(0,0, room_width, room_height, c_gray, c_gray, c_gray, c_gray, false)
		draw_set_font(fnt_combat_finished)
		draw_text_color(350, 350, "COMBAT FINISHED", c_black, c_black, c_black, c_black, 1)
		draw_set_font(fnt_button)
		break
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