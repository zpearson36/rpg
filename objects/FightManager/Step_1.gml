/// @description Insert description here

switch(state)
{
	case FMStates.INIT:
	{
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
		
		var player_quad = irandom(3)
		var xl = 0
		var xr = COMBATGRIDWIDTH / 4 - 1
		var yl = 0
		var yr = COMBATGRIDHEIGHT / 4 - 1
		switch(player_quad)
		{
			case 0:{break;}
			case 1:{xl = .75 * COMBATGRIDWIDTH; xr = COMBATGRIDWIDTH - 1;break;}
			case 2:{yl = .75 * COMBATGRIDWIDTH; yr = COMBATGRIDWIDTH - 1;break;}
			case 3:
			{
				xl = .75 * COMBATGRIDWIDTH;
				xr = COMBATGRIDWIDTH - 1;
				yl = .75 * COMBATGRIDWIDTH;
				yr = COMBATGRIDWIDTH - 1;break;
			}
		}
		for(var i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(var j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				if(i >= xl and i <= xr and j >= yl and j <= yr) continue
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
				var tmp_xl = xl
				var tmp_xr = xr
				var tmp_yl = yl
				var tmp_yr = yr
				if(units[k][i].get_faction() != GameManager.player_faction)
				{
					tmp_xl = 0
					tmp_xr = COMBATGRIDWIDTH - 1
					tmp_yl = 0
					tmp_yr = COMBATGRIDHEIGHT - 1
				}
				var xx = irandom_range(tmp_xl,tmp_xr)
				var yy = irandom_range(tmp_yr,tmp_yr)
				while(grid.get_cell(xx, yy).get_occupant() != noone
				      or grid.get_cell(xx, yy).get_terrain().get_type() == TerrainType.IMPASSIBLE)
				{
					xx = irandom_range(tmp_xl,tmp_xr)
					yy = irandom_range(tmp_yr,tmp_yr)
				}
				grid.get_cell(xx, yy).set_occupant(units[k][i])
				units[k][i].set_xpos(xx * COMBATCELLSIZE)
				units[k][i].set_ypos(yy * COMBATCELLSIZE)
			}
		}
				switch(player_quad)
		{
			case 0:{xl = 0; yl = 0;break;}
			case 1:{xl = .5 * COMBATGRIDWIDTH; yl = 0;break;}
			case 2:{xl = 0; yl = .5 * COMBATGRIDWIDTH;break;}
			case 3:{xl = .5 * COMBATGRIDWIDTH; yl = .5 * COMBATGRIDWIDTH;break;}
		}
		camera_set_view_pos(view_camera[0], xl * COMBATCELLSIZE, yl * COMBATCELLSIZE)
		state = FMStates.RUNNING
		break;
	}
	case FMStates.RUNNING:
	{
		var break_case = false
		for(var i = 0; i < array_length(units); i++)
		{
			if(array_length(units[i]) == 0)
			{
				print("We done fucked up")
				state = FMStates.COMBATFINISHED
				alarm[0] = 180
				break_case = true
			}
		}
		if(break_case) break
		for(i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				grid.get_cell(i, j).set_unobserved()
				grid.get_cell(i, j).set_unobstructed()
				for(var k = 0; k < array_length(units); k++)
				{
					//if(units[k][0].get_faction() != get_character().get_faction()) continue
					for(var l = 0; l < array_length(units[k]); l++)
					{
						var obstructed = collision_line((units[k][l].get_tile().get_x() + .5) * COMBATCELLSIZE, (units[k][l].get_tile().get_y() + .5) * COMBATCELLSIZE,
						        grid.get_cell(i, j).get_x() * COMBATCELLSIZE, grid.get_cell(i, j).get_y() * COMBATCELLSIZE, oWall, false, false)
						if(obstructed == noone)
						{
							if(units[k][0].get_faction() != GameManager.player_faction) continue
							grid.get_cell(i, j).set_observed()
						}
						else
						{
							if(character != undefined and get_character() == units[k][l]) grid.get_cell(i, j).set_obstructed()
						}
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
