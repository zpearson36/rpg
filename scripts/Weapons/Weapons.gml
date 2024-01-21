function gen_id_weapon()
{
	static weapon = 0;
	weapon++;
	return weapon;
}

enum WEAPONTYPE
{
	UNARMED,
	SWORD,
	SPEAR,
	BOW
}

function CreateUnarmed()
{
	return new Weapon("Unarmed", WEAPONTYPE.UNARMED, 5, sArmourNone, 0, [35,0,0,0,0])
}

function CreateSword()
{
	return new Weapon("Sword", WEAPONTYPE.SWORD, 15, sWeaponSword, 50, [15,0,0,0,20])
}

function CreateSpear()
{
	return new Weapon("Spear", WEAPONTYPE.SPEAR, 15, sWeaponSpear, 50, [25,0,0,0,10], function(dist){return -250*power(dist - 1.75, 4) + 100})
}

function CreateBow()
{
	return new Weapon("Bow", WEAPONTYPE.BOW, 15, sWeaponBow, 50, [0,0,0,0,35], function(dist){return -30*power(dist-3, 4) + 100})
}

function Weapon(_name, _type, _base_damage, _sprite, _value, _scaling=[0,0,0,0,0], _func = function(dist){return -100 * power(dist - 1, 2) + 100}) constructor
{
	name = _name
	type = _type
	base_damage = _base_damage
	item_type = ItemTypes.WEAPON
	sprite = _sprite
	id_num = gen_id_weapon()
	base_value = _value
	range_function = _func
	attr_scaling = new Attributes()
	attr_scaling.init(_scaling)
	
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
	
	function get_base_damage()
	{
		return base_damage
	}
	
	function hit_chance(dist)
	{
		return range_function(dist)
	}
	
	function get_scaling()
	{
		return attr_scaling
	}
	
	function get_scaling_damage(_attrs)
	{
		var str = _attrs.get_attr("str").get_value() * get_scaling().get_attr("str").get_value() / 100
		var spd = _attrs.get_attr("spd").get_value() * get_scaling().get_attr("spd").get_value() / 100
		var dex = _attrs.get_attr("dex").get_value() * get_scaling().get_attr("dex").get_value() / 100
		var endu = _attrs.get_attr("end").get_value() * get_scaling().get_attr("end").get_value() / 100
		var int = _attrs.get_attr("int").get_value() * get_scaling().get_attr("int").get_value() / 100
		
		return str + spd + dex + endu + int
	}
}