function gen_id_armour()
{
	static armour = 0;
	armour++;
	return armour;
}

enum ARMOURTYPES
{
	UNARMOURED,
	LIGHT,
	MEDIUM,
	HEAVY
}

function CreateUnarmoured()
{
	return new Armour("Unarmoured", 0, 0, ARMOURTYPES.UNARMOURED, sArmourNone, 0);
}

function CreateLightArmour()
{
	return new Armour("Light Armour", 3, .10, ARMOURTYPES.LIGHT, sArmourLight, 100);
}

function CreateMediumArmour()
{
	return new Armour("Medium Armour", 5, .20, ARMOURTYPES.MEDIUM, sArmourMedium, 500);
}

function CreateHeavyArmour()
{
	return new Armour("Heavy Armour", 7, .35, ARMOURTYPES.HEAVY, sArmourHeavy, 1000);
}

function Armour(_name, _threshold, _resistance, _type, _sprite, _value) constructor
{
	type = _type
	name = _name
	threshold = _threshold
	resistance = _resistance
	item_type = ItemTypes.ARMOUR
	sprite = _sprite
	id_num = gen_id_armour()
	base_value = _value
	
	function get_value()
	{
		return base_value
	}
	
	function get_id()
	{
		return id_num
	}
	
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