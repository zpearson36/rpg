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
				c_color = c_white
				draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
				                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
									 c_color, c_color, c_color, c_color, false);
				draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
				                     (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
									 c_black, c_black, c_black, c_black, true);
				switch(units[character].get_state())
				{
					case COMBATCHARACTERSTATES.IDLE:
					{
						break;
					}
					case COMBATCHARACTERSTATES.MOVING:
					{
						if(point_distance(i, j,
									      units[character].get_tile().get_x(),
										  units[character].get_tile().get_y()
										  ) <= units[character].get_ap() * units[character].get_attr("spd")
							and grid.get_cell(i,j).get_occupant() == noone)
						{
							draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
						                    (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_yellow, c_yellow, c_yellow, c_yellow, false);
						}
						if(point_distance(i, j,
									      units[character].get_tile().get_x(),
										  units[character].get_tile().get_y()
										  ) <= units[character].get_ap() * units[character].get_attr("spd")
						    and point_distance(i, j,
									      units[character].get_tile().get_x(),
										  units[character].get_tile().get_y()
										  ) > units[character].get_attr("spd")
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
