enum ARMOURTYPES
{
	HEAD,
	TORSO,
	GLOVES,
	LEGS,
	FEET
}

function Armour(_name, _rating) constructor
{
	name = _name
	rating = _rating
	item_type = ItemTypes.ARMOUR
	
	function get_type()
	{
		return type
	}
	
	function get_name()
	{
		return name
	}
	
	function get_rating()
	{
		return rating
	}
	
	function get_item_type()
	{
		return item_type
	}
}