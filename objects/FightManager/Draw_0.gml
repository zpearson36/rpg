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
				draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
				                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
									 c_color, c_color, c_color, c_color, false);
				draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
				                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
									 c_black, c_black, c_black, c_black, true);
				if(grid.get_cell(i,j).get_occupant() != noone
				   and grid.get_cell(i,j).get_occupant().get_state() == COMBATCHARACTERSTATES.DEAD)
				   {
					   var deadIndex = array_get_index(units, grid.get_cell(i,j).get_occupant())
					   if(deadIndex != -1)
					   {
							 show_debug_message(character)
						   if(deadIndex <= character) character--
						   units = array_delete_index(units, deadIndex)
					   }
				   }
				switch(units[character].get_state())
				{
					case COMBATCHARACTERSTATES.IDLE:
					{
						break;
					}
					case COMBATCHARACTERSTATES.MOVING:
					{
						var dist = point_distance(i, j,
									      units[character].get_tile().get_x(),
										  units[character].get_tile().get_y()
										  )
						if     (dist <= units[character].get_ap() * units[character].get_attr("spd")
							and grid.get_cell(i,j).get_occupant() == noone)
						{
							draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
						                    (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_yellow, c_yellow, c_yellow, c_yellow, false);
						}
						if     (dist <= units[character].get_ap() * units[character].get_attr("spd")
						    and dist > units[character].get_attr("spd")
							and grid.get_cell(i,j).get_occupant() == noone)
						{
							draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
						                    (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_orange, c_orange, c_orange, c_orange, false);
						}
						break;
					}
					case COMBATCHARACTERSTATES.ATTACKING:
					{
						var dist = point_distance(i, j,
									      units[character].get_tile().get_x(),
										  units[character].get_tile().get_y()
										  )
						if (ceil(dist) <= units[character].get_attack_range_max()
						and ceil(dist) >= units[character].get_attack_range_min())
						{
							var c_color = c_red
							if(grid.get_cell(i,j).get_occupant() != noone) c_color = c_lime
							draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
						                    (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_color, c_color, c_color, c_color, false);
						}
						break;
					}
				}
				if(grid.get_cell(i,j).get_occupant() != noone
				       and grid.get_cell(i,j).get_occupant().get_sprite() != undefined)
				   draw_sprite(grid.get_cell(i,j).get_occupant().get_sprite(), -1,
				       i * COMBATCELLSIZE, j * COMBATCELLSIZE)
			    if(grid.get_cell(i,j).get_occupant() == units[character])
				{
					for(var k = 0; k < grid.get_cell(i,j).get_occupant().get_ap_max(); k++)
					{
						var sprt = sAPSpent
						if(grid.get_cell(i,j).get_occupant().get_ap() > k) sprt = sAPAvailable
						draw_sprite(sprt, -1, i * COMBATCELLSIZE + (16*k), j * COMBATCELLSIZE - 16)
					}
				}
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
