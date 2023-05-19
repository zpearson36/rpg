enum ARMOURTYPES
{
	UNARMOURED,
	LIGHT,
	MEDIUM,
	HEAVY
}

function CreateUnarmoured()
{
	return new Armour("Unarmoured", 0, 0, ARMOURTYPES.UNARMOURED, sArmourNone);
}

function CreateLightArmour()
{
	return new Armour("Light Armour", 3, .10, ARMOURTYPES.LIGHT, sArmourLight);
}

function CreateMediumArmour()
{
	return new Armour("Medium Armour", 5, .20, ARMOURTYPES.MEDIUM, sArmourMedium);
}

function CreateHeavyArmour()
{
	return new Armour("Heavy Armour", 7, .35, ARMOURTYPES.HEAVY, sArmourHeavy);
}

function Armour(_name, _threshold, _resistance, _type, _sprite) constructor
{
	type = _type
	name = _name
	threshold = _threshold
	resistance = _resistance
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
	
	function get_threshold()
	{
		return threshold
	}
	
	function get_resistance()
	{
		return resistance
	}
	
	function get_item_type()
	{
		return item_type
	}
}