enum ARMOURTYPES
{
	UNARMOURED,
	LIGHT,
	MEDIUM,
	HEAVY
}

function CreateUnarmoured()
{
	return new Armour("Unarmoured", 0, ARMOURTYPES.UNARMOURED, sArmourNone);
}

function CreateLightArmour()
{
	return new Armour("Light Armour", 1, ARMOURTYPES.LIGHT, sArmourLight);
}

function CreateMediumArmour()
{
	return new Armour("Medium Armour", 2, ARMOURTYPES.MEDIUM, sArmourMedium);
}

function CreateHeavyArmour()
{
	return new Armour("Heavy Armour", 3, ARMOURTYPES.HEAVY, sArmourHeavy);
}

function Armour(_name, _rating, _type, _sprite) constructor
{
	type = _type
	name = _name
	rating = _rating
	item_type = ItemTypes.ARMOUR
	sprite = _sprite
	
	function get_sprite()
	{
		return sprite
	}
	
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