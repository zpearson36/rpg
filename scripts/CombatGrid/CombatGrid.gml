#macro COMBATGRIDWIDTH  16
#macro COMBATGRIDHEIGHT 16
#macro COMBATCELLSIZE   64

enum TerrainType
{
	NONE, //Not meant to be used
	CLEAR,
	MUDDY,
	SHALLOWWATER,
	DEEPWATER,
	IMPASSIBLE
}

function Terrain(_type, _cost, _sprite) constructor
{
	type = _type
	cost = _cost
	sprite = _sprite
	
	function get_type()
	{
		return type
	}
	
	function get_cost()
	{
		return cost
	}
	
	function get_sprite()
	{
		return sprite
	}
}

function ClearTerrain()
{
	return new Terrain(TerrainType.CLEAR, 1, sTileClear)
}

function CombatCell(_x, _y) constructor
{
	pos_x = _x;
	pos_y = _y;
	occupant = noone;
	terrain = ClearTerrain()
	path = undefined
	path_cost = undefined
	
	function set_path(_path, _cost)
	{
		path = _path
		path_cost = _cost
	}
	
	function get_path()
	{
		return path
	}
	
	function get_path_cost()
	{
		return path_cost
	}
	
	function get_terrain()
	{
		return terrain
	}
	
	function get_x()
	{
		return pos_x;
	}
	
	function get_y()
	{
		return pos_y;
	}
	
	function get_occupant()
	{
		return occupant;
	}
	
	function set_occupant(_occ)
	{
		occupant = _occ;
		if(_occ != noone)
		{
			var tmp = _occ.get_tile()
			if(tmp != undefined) tmp.set_occupant(noone);
			occupant.set_tile(self);
		}
		return true
	}
}

function CombatGrid() constructor
{
	combat_grid = []
	
	function init()
	{
		for(i = 0; i < COMBATGRIDWIDTH; i++)
		{
			for(j = 0; j < COMBATGRIDHEIGHT; j++)
			{
				combat_grid[i][j] = new CombatCell(i,j);
			}
		}
	}
	
	function get_cell(_x, _y)
	{
		return combat_grid[_x][_y];
	}
	
	function get_path_cost(_path)
	{
		var cost = 0
		for(var i = 0; i < array_length(_path); i++)
		{
			cost += get_cell(_path[i][0], _path[i][1]).get_terrain().get_cost()
		}
		
		return cost
	}
}