// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Skill(_name) constructor
{
	name = _name
	value = 0
	
	function get_name()
	{
		return name
	}
	
	function get_value()
	{
		return value
	}
	
	function set_value(_val)
	{
		value = _val
	}
	
	function increase_value()
	{
		value++
	}
	
	function decrease_value()
	{
		value--
	}
}

function Skills() constructor
{
	skill_map = ds_map_create()
	skill_map[? "Unarmed"] = new Skill("Unarmed")
	skill_map[? "Sword"] = new Skill("Sword")
	skill_map[? "Spear"] = new Skill("Spear")
	skill_map[? "Bow"] = new Skill("Bow")
	
	function get_skill(_skill)
	{
		return skill_map[? _skill]
	}
	
	function init(_skills = [])
	{
		if(array_length(_skills) > 0)
		{
			skill_map[? "Unarmed"].set_value(_skills[0])
			skill_map[? "Sword"].set_value(_skills[1])
			skill_map[? "Bow"].set_value(_skills[2])
			skill_map[? "Spear"].set_value(_skills[3])
		}
		else
		{
			skill_map[? "Unarmed"].set_value(0)
			skill_map[? "Sword"].set_value(0)
			skill_map[? "Spear"].set_value(0)
			skill_map[? "Bow"].set_value(0)
		}
	}
	
	function get_skills()
	{
		return skill_map
	}
}