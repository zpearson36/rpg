function gen_id_faction()
{
	static faction = 0;
	faction++;
	return faction;
}

function Faction(_name) constructor
{
	factionID = gen_id_faction
	name = _name
	members = []
	
	function set_name(_name)
	{
		name = _name
	}
	
	function get_name()
	{
		return name
	}
	
	function add_member(_mem)
	{
		members[array_length(members)] = _mem
		_mem.set_faction(self)
	}
	
	function get_members()
	{
		return members
	}
	
	function get_id()
	{
		return factionID
	}
}

function FactionManager() constructor
{
	faction_grid = ds_grid_create(1,1)
	
	function add_faction(_fact)
	{
		var size = ds_grid_height(faction_grid)
		if(_fact.get_id() >= size) ds_grid_resize(faction_grid, _fact.get_id() + 1, _fact.get_id() + 1)
		faction_grid[# _fact.get_id(), _fact.get_id()] = 0
	}
	
	function set_relation(fac1, fac2, rel)
	{
		var size = ds_grid_height(faction_grid)
		if(fac1.get_id() >= size or fac2.get_id() >= size) return false
		faction_grid[# fac1.get_id(), fac2.get_id()] = rel
		faction_grid[# fac2.get_id(), fac1.get_id()] = rel
		return true
	}
	
	function get_relation(fac1, fac2)
	{
		return faction_grid[# fac1.get_id(), fac2.get_id()]
	}
}