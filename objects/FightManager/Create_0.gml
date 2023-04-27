enum FMStates
{
	INIT,
	SETUP,
	RUNNING,
	COMBATFINISHED,
	DEACTIVATING,
	INACTIVE
}

state = FMStates.INACTIVE
character = undefined
party = undefined
grid = undefined
units = []
function get_state()
{
	return state;
}
function activate()
{
	if(state == FMStates.INACTIVE)
	{
		for(var k = 0; k < argument_count; k++)
		{
			for(var i = 0; i < array_length(argument[k]); i++)
			{
				units[k][i] = new CombatCharacter(argument[k][i])
			}
		}
		party = 0
		character = 0
		state = FMStates.INIT
	}
}
function deactivate()
{
	state = FMStates.DEACTIVATING
}

function get_character()
{
	return units[party][character];
}

function prepare_move()
{
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDWIDTH; j++)
		{
			grid.get_cell(i, j).set_path(undefined, undefined)
			var dist = dist_to_targ(get_character().get_tile(),
									grid.get_cell(i, j)) 
			if(grid.get_cell(i, j).get_occupant() == get_character()) grid.get_cell(i, j).set_path([], 0)
			else if(dist <= get_character().get_attr("spd") * 2 and grid.get_cell(i, j).get_occupant() == noone)
			{
				var path = pathfinding(get_character().get_tile(), grid.get_cell(i, j), grid)
				var path_cost = grid.get_path_cost(path)
				grid.get_cell(i, j).set_path(path, path_cost)
			}
		}
	}
	get_character().to_init_move()
}

function get_grid()
{
	return grid
}
function next_party()
{
	
	gui.deactivateGUI()
	party++;
	if(party == array_length(units)) party = 0
	for(var i = 0; i < array_length(units[party]); i++)
	{
		units[party][i].reset_ap()
	}
	character = 0
}

gui = instance_create_layer(x, y, "Instances", FightGUI)