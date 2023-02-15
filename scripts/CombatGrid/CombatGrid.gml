#macro COMBATGRIDWIDTH  16
#macro COMBATGRIDHEIGHT 16
#macro COMBATCELLSIZE   64

function CombatCell(_x, _y) constructor
{
	pos_x = _x;
	pos_y = _y;
	occupant = noone;
	
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
}