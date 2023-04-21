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
			var hit_chance = targ_array[1]
			//var distance_to_targ = targ_array[2]
			var distance_to_tile = dist_to_targ(char.get_tile(),
							    	grid.get_cell(i, j))
			
			//[target, Action Value] -- Action Value = (Chance to hit target) - (AP needed to move / available AP)
			action_grid[# i, j] = [targ_array[0], (hit_chance * 100) - (ceil(distance_to_tile / char.get_attr("spd")) / char.get_ap())]
		}
	}
	
	return action_grid
}

function generate_target_grid(char, grid)
{
	var target_grid = ds_grid_create(COMBATGRIDWIDTH, COMBATGRIDHEIGHT)
	ds_grid_clear(target_grid, [noone, -100, 1000])
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDHEIGHT; j++)
		{
			var dist = dist_to_targ(char.get_tile(),
							    	grid.get_cell(i, j)
								    )
			if(dist <= char.get_ap() * char.get_attr("spd"))
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
			   and FactionManager.get_relation(char.get_faction(), grid.get_cell(i, j).get_occupant().get_faction()) < 0)
			{
				var dist = dist_to_targ(tile, grid.get_cell(i, j))
				if(ceil(dist) <= char.get_attack_range_max()
				   and ceil(dist) >= char.get_attack_range_min())
				{
					if(targ == noone)
					{
						targ       = grid.get_cell(i, j).get_occupant()
						hit_chance = chance_to_hit(char, grid.get_cell(i, j).get_occupant(), tile)
						targ_dist  = dist
						//print(hit_chance)
					}
					else if(chance_to_hit(char, grid.get_cell(i, j).get_occupant()) > chance_to_hit(char, targ))
					{
						//print("poop")
						targ = grid.get_cell(i, j).get_occupant()
						hit_chance = chance_to_hit(char, grid.get_cell(i, j).get_occupant(), tile)
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
				   and FactionManager.get_relation(char.get_faction(), grid.get_cell(i, j).get_occupant().get_faction()) < 0)
				{
					    var dist = dist_to_targ(tile, grid.get_cell(i, j))
						if(targ == noone)
						{
						//print(3)
							targ = grid.get_cell(i, j).get_occupant()
							hit_chance = 0
							targ_dist  = dist_to_targ(tile, grid.get_cell(i, j))
						}
						else if(dist_to_targ(tile, grid.get_cell(i, j)) < dist_to_targ(tile, targ.get_tile()))
						{
						//print(4)
							targ = grid.get_cell(i, j).get_occupant()
							hit_chance = 0
							targ_dist  = dist_to_targ(tile, grid.get_cell(i, j))
						}
				}
			}
		}
	}
	//print(hit_chance)
	return [targ, hit_chance, targ_dist]
}

function get_action(_char)
{
	var action;
	var target;
	
	return [action, target]
}