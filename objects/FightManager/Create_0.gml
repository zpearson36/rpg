enum FMStates
{
	INIT,
	SETUP,
	RUNNING,
	COMBATFINISHED,
	DEACTIVATING,
	INACTIVE
}
grass = []
state = FMStates.INACTIVE
character = undefined
party = undefined
grid = undefined
units = []
obstructions = []
reward = 0
player_wins = false
function get_state()
{
	return state;
}
function activate()
{
	if(state == FMStates.INACTIVE)
	{
		for(var k = 1; k < argument_count; k++)
		{
			for(var i = 0; i < array_length(argument[k]); i++)
			{
				units[k-1][i] = new CombatCharacter(argument[k][i])
			}
		}
		party = 0
		character = 0
		reward = calculate_reward(argument[0])
		state = FMStates.INIT
	}
	layer_set_visible("buildings", false)
	layer_set_visible("roof", false)
}
function deactivate()
{
	state = FMStates.DEACTIVATING
}

function get_character()
{
	return units[party][character];
}

function prepare_move(is_ai = false)
{
	if(is_ai)
	{
		for(var i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(var j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				grid.get_cell(i, j).set_path(undefined, undefined)
				var dist = dist_to_targ(get_character().get_tile(),
										grid.get_cell(i, j)) 
				if(grid.get_cell(i, j).get_occupant() == get_character()) grid.get_cell(i, j).set_path([], 0)
				else if(dist <= get_character().get_attr("spd").get_value() * get_character().get_ap()
				and (grid.get_cell(i, j).get_occupant() == noone or grid.get_cell(i, j).get_occupant().is_dead())
				and (grid.get_cell(i, j).get_terrain().get_type() != TerrainType.IMPASSIBLE))
				{
					var path = pathfinding(get_character().get_tile(), grid.get_cell(i, j), grid)
					if(path != undefined)
					{
						var path_cost = grid.get_path_cost(path)
						//checks path cost to ensure full path is traversable with given action points
						if(path_cost <= get_character().get_attr("spd").get_value() * get_character().get_ap())
						    grid.get_cell(i, j).set_path(path, path_cost)
					}
				}
			}
		}
	}
	get_character().to_init_move() //Line only affects player characters. AI controlled characters ignore this
}

function calculate_path(_tile)
{
	var valid_path = false
	_tile.set_path(undefined, undefined)
	if(_tile.get_occupant() == get_character()) _tile.set_path([], 0)
	else if(_tile.get_occupant() == noone
	and (_tile.get_terrain().get_type() != TerrainType.IMPASSIBLE))
	{
		var path = pathfinding(get_character().get_tile(), _tile, grid)

		var path_cost = grid.get_path_cost(path)
		_tile.set_path(path, path_cost)
		if(path_cost <= get_character().get_attr("spd").get_value() * get_character().get_ap()) valid_path = true
	}
	return valid_path
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

function move_character(_char)
{
	_char.frame_count()
	var dx = _char.get_path_step()[0] - _char.get_tile().get_x()
	var dy = _char.get_path_step()[1] - _char.get_tile().get_y()
	_char.set_xpos(_char.get_xpos() + (spd * dx))
	_char.set_ypos(_char.get_ypos() + (spd * dy))
	if(dx == -1) _char.get_character().set_facing(DIRECTION.LEFT)
	if(dx ==  1) _char.get_character().set_facing(DIRECTION.RIGHT)
	if(dy == -1) _char.get_character().set_facing(DIRECTION.UP)
	if(dy ==  1) _char.get_character().set_facing(DIRECTION.DOWN)
	
	if(    ( ceil(_char.get_xpos() / COMBATCELLSIZE) != _char.get_tile().get_x() and dx == -1)
		or (floor(_char.get_xpos() / COMBATCELLSIZE) != _char.get_tile().get_x() and dx ==  1)
		or ( ceil(_char.get_ypos() / COMBATCELLSIZE) != _char.get_tile().get_y() and dy == -1)
		or (floor(_char.get_ypos() / COMBATCELLSIZE) != _char.get_tile().get_y() and dy ==  1)
		)
	{
		grid.get_cell(_char.get_path_step()[0], _char.get_path_step()[1]).set_occupant(_char)
		var next_tile = _char.proceed_on_path()
	}
	if(_char.get_tile() == _char.get_dest())
	{
		repeat(ceil(_char.get_dest().get_path_cost()
					/ _char.get_attr("spd").get_value()))
		{_char.spend_ap();}
		_char.to_idle()
	}
}

gui = instance_create_layer(x, y, "Instances", FightGUI)
spd = 5