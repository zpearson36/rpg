enum WEAPONTYPE
{
	UNARMED,
	SWORD,
	BOW
}

function CreateSword()
{
	return new Weapon("Sword", WEAPONTYPE.SWORD, 1, 2, 7, 15, sWeaponSword)
}

function CreateBow()
{
	return new Weapon("Bow", WEAPONTYPE.SWORD, 3, 4, 7, 15, sWeaponBow)
}

function Weapon(_name, _type, _min_range, _max_range, _min_damage, _max_damage, _sprite) constructor
{
	name = _name
	type = _type
	min_range = _min_range
	max_range = _max_range
	min_damage = _min_damage
	max_damage = _max_damage
	item_type = ItemTypes.WEAPON
	sprite = _sprite
	
	function get_sprite()
	{
		return sprite
	}
	
	function get_item_type()
	{
		return item_type
	}
	
	function get_name()
	{
		return name
	}
	
	function get_type()
	{
		return type
	}
	
	function get_min_range()
	{
		return min_range
	}
	
	function get_max_range()
	{
		return max_range
	}	
	
	function get_min_damage()
	{
		return min_damage
	}
	
	function get_max_damage()
	{
		return max_damage
	}
}