function Attribute(_name, _value) constructor
{
	name  = _name;
	value = _value;
	
	function get_name()
	{
		return name;
	}
	
	function get_value()
	{
		return value;
	}
}

function Attributes() constructor
{
	attribute_list = ds_map_create();
	
	function init(attr_array = [])
	{
		if(array_length(attr_array) < 3) //temp value of 3 for str, spd, int
		{
			attribute_list[? "str"] = new Attribute("str", 3);
			attribute_list[? "spd"] = new Attribute("spd", 3);
			attribute_list[? "int"] = new Attribute("int", 3);
		}
		else
		{
			attribute_list[? "str"] = new Attribute("str", attr_array[0]);
			attribute_list[? "spd"] = new Attribute("spd", attr_array[1]);
			attribute_list[? "int"] = new Attribute("int", attr_array[2]);
		}
	}
	
	function get_attr(_attr)
	{
		return attribute_list[? _attr].get_value()
	}
}