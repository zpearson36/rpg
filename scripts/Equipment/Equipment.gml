enum ItemTypes
{
	WEAPON,
	ARMOUR
}
function Equipment() constructor
{
	weapon = CreateUnarmed()
	armour = CreateUnarmoured()
	
	function get_weapon()
	{
		return weapon
	}
	
	function get_armour()
	{
		return armour
	}
	
	function unequip(_item)
	{
		var tmp
		switch(_item.get_item_type())
		{
			case ItemTypes.WEAPON:
			{
				tmp = weapon
				weapon = CreateUnarmed()
				break;
			}
			case ItemTypes.ARMOUR:
			{
				tmp = armour
				armour = CreateUnarmoured()
				break;
			}
		}
		return tmp
	}
	
	function equip(_item)
	{
		var tmp
		switch(_item.get_item_type())
		{
			case ItemTypes.WEAPON:
			{print("poop")
				tmp = weapon
				weapon = _item
				break;
			}
			case ItemTypes.ARMOUR:
			{print("fuck")
				tmp = armour
				armour = _item
				break;
			}
		}
		return tmp
	}
}