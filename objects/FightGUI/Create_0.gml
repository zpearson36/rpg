/// @description Insert description here
// You can write your code in this editor
enum FIGHTGUISTATES
{
	ACTIVE,
	INACTIVE
}

state = FIGHTGUISTATES.INACTIVE
fight_manager = undefined

function activateGUI(_mgr)
{
	fight_manager = _mgr
	state = FIGHTGUISTATES.ACTIVE
}

function deactivateGUI()
{
	state = FIGHTGUISTATES.INACTIVE
}

function prepare_move()
{
	var grid = fight_manager.get_grid()
	for(var i = 0; i < COMBATGRIDWIDTH; i++)
	{
		for(var j = 0; j < COMBATGRIDWIDTH; j++)
		{
			grid.get_cell(i, j).set_path(undefined, undefined)
			var dist = dist_to_targ(fight_manager.get_character().get_tile(),
									grid.get_cell(i, j)) 
									
			if(dist <= fight_manager.get_character().get_attr("spd") * 2 and grid.get_cell(i, j).get_occupant() == noone)
			{
				var path = pathfinding(fight_manager.get_character().get_tile(), grid.get_cell(i, j), grid)
				var path_cost = grid.get_path_cost(path)
				grid.get_cell(i, j).set_path(path, path_cost)
			}
		}
	}
	fight_manager.get_character().to_move()
}