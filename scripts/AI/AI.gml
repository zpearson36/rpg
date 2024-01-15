//Combat AI
enum AI_ACTIONS
{
	MOVE,
	ATTACK
}

function generate_action_grid(char, grid)
{
    var target_grid = generate_target_grid(char, grid)
	var action_grid = ds_grid_create(COMBATGRIDWIDTH, COMBATGRIDHEIGHT)
	ds_grid_clear(action_grid, 0)
	
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			var targ_array = target_grid[# i, j]
			action_grid[# i, j] = [noone, -10000]
			
			if(grid.get_cell(i, j).get_path_cost() != undefined)
				{
					
					var hit_chance = targ_array[1]
					var distance_to_targ = targ_array[2]
					var distance_to_tile = dist_to_targ(char.get_tile(),
										    grid.get_cell(i, j))
			
					//[target, Action Value] -- Action Value = (Chance to hit target) / (AP needed to move / available AP) + (1 - (Distance to target / Size of Grid)
					var t = 0
					if(grid.get_cell(i, j).get_occupant() != noone and grid.get_cell(i, j).get_occupant() != char) t = -10000
					var val = (t + 
					(hit_chance * 100) / 
					    max(ceil(grid.get_cell(i, j).get_path_cost() / 
					    char.get_attr("spd").get_value()), .1) + 
					(1 - (distance_to_targ / COMBATGRIDHEIGHT)))// - ceil(distance_to_tile / char.get_attr("spd").get_value()) + (char.get_attack_range_max() - distance_to_targ) + (distance_to_targ - char.get_attack_range_min())
			
					action_grid[# i, j] = [targ_array[0], val]
					//if(val > -10000) print("yes")
				}
		}
	}
	
	return action_grid
}

function generate_target_grid(char, grid)
{
	var target_grid = ds_grid_create(COMBATGRIDWIDTH, COMBATGRIDHEIGHT)
	ds_grid_clear(target_grid, [noone, -10000, 10000])
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			var dist = dist_to_targ(char.get_tile(),
							    	grid.get_cell(i, j)
								    )
			if(grid.get_cell(i, j).get_path_cost() <= char.get_ap() * char.get_attr("spd").get_value())
			{
				target_grid[# i, j] = find_target(char, grid, grid.get_cell(i, j))
			}
		}
	}
	return target_grid
}

function find_target(char, grid, tile)
{
	var targ = noone
	var hit_chance = 0
	var targ_dist = 0
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			if(grid.get_cell(i, j).get_occupant() != noone
			   and FactionManager.get_relation(char.get_faction(), grid.get_cell(i, j).get_occupant().get_faction()) < 0
			   and not grid.get_cell(i, j).get_occupant().is_dead())
			{
				var dist = dist_to_targ(tile, grid.get_cell(i, j))
				if(ceil(dist) <= char.get_attack_range_max()
				   and ceil(dist) >= char.get_attack_range_min()
				   and not grid.get_cell(i, j).is_obstructed())
				{
					if(targ == noone)
					{
						targ       = grid.get_cell(i, j).get_occupant()
						hit_chance = char.get_hit_chance(grid.get_cell(i, j).get_occupant())
						targ_dist  = dist
					}
					else if(char.get_hit_chance_hypothetical(tile, grid.get_cell(i, j).get_occupant()) > char.get_hit_chance_hypothetical(tile, targ))
					{
						targ = grid.get_cell(i, j).get_occupant()
						hit_chance = char.get_hit_chance(grid.get_cell(i, j).get_occupant())
						targ_dist  = dist
					}
					
				}
			}
		}
	}
	
	if(targ == noone)
	{
		for(var i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(var j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				if(grid.get_cell(i, j).get_occupant() != noone
				   and FactionManager.get_relation(char.get_faction(), grid.get_cell(i, j).get_occupant().get_faction()) < 0
				   and not grid.get_cell(i, j).get_occupant().is_dead())
				{
					    var dist = dist_to_targ(tile, grid.get_cell(i, j))
						if(targ == noone)
						{
							targ = grid.get_cell(i, j).get_occupant()
							hit_chance = 0
							targ_dist  = ceil(dist)
						}
						else if(ceil(dist_to_targ(tile, grid.get_cell(i, j))) < ceil(dist_to_targ(tile, targ.get_tile())))
						{
							targ = grid.get_cell(i, j).get_occupant()
							hit_chance = 0
							targ_dist  = ceil(dist)
						}
				}
			}
		}
	}
	return [targ, hit_chance, targ_dist]
}

function get_action(_char)
{
	var action;
	var target;
	
	return [action, target]
}