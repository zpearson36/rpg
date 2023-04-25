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
				switch(units[party][character].get_state())
				{
					case COMBATCHARACTERSTATES.IDLE:
					{
						break;
					}
					case COMBATCHARACTERSTATES.MOVING:
					{
						var dist = dist_to_targ(
						                  units[party][character].get_tile(),
										  grid.get_cell(i, j)
										  )
						if     (dist <= units[party][character].get_ap() * units[party][character].get_attr("spd")
							and grid.get_cell(i,j).get_occupant() == noone)
						{
							draw_rectangle_color(i * COMBATCELLSIZE, j * COMBATCELLSIZE,
						                    (i + 1) * COMBATCELLSIZE, (j + 1) * COMBATCELLSIZE,
											c_yellow, c_yellow, c_yellow, c_yellow, false);
						}
						if     (dist <= units[party][character].get_ap() * units[party][character].get_attr("spd")
						    and dist > units[party][character].get_attr("spd")
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
						draw_set_font(fnt_hitchance)
						var mx = floor(mouse_x / COMBATCELLSIZE)
						var my = floor(mouse_y / COMBATCELLSIZE)
						if(mx >= 0 and mx < COMBATGRIDWIDTH and my >= 0 and my < COMBATGRIDHEIGHT and grid.get_cell(mx,my).get_occupant() != noone)
							    draw_text_color(mx * COMBATCELLSIZE, my * COMBATCELLSIZE,
								chance_to_hit(units[party][character], grid.get_cell(mx,my).get_occupant()),
								c_black, c_black, c_black, c_black, 1)
						var dist = dist_to_targ(
						                  units[party][character].get_tile(),
										  grid.get_cell(i, j)
										  )
						if (ceil(dist) <= units[party][character].get_attack_range_max()
						and ceil(dist) >= units[party][character].get_attack_range_min())
						{
							var c_color = c_red
							if(grid.get_cell(i,j).get_occupant() != noone)
							{
								var fac1 = grid.get_cell(i,j).get_occupant().get_faction()
								var fac2 = units[party][character].get_faction()
								if(FactionManager.get_relation(fac1, fac2) < 0) c_color = c_lime
							}
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
			    if(grid.get_cell(i,j).get_occupant() == units[party][character])
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
