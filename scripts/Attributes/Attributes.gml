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
	
	function increase(_val)
	{
		value += _val
	}
}

function Attributes() constructor
{
	attribute_list = ds_map_create();
	
	function init(attr_array = [])
	{
		if(array_length(attr_array) < 4) //temp value of 3 for str, spd, int
		{
			attribute_list[? "str"] = new Attribute("str", 3);
			attribute_list[? "spd"] = new Attribute("spd", 3);
			attribute_list[? "int"] = new Attribute("int", 3);
			attribute_list[? "end"] = new Attribute("end", 3);
		}
		else
		{
			print("poop")
			attribute_list[? "str"] = new Attribute("str", attr_array[0]);
			attribute_list[? "spd"] = new Attribute("spd", attr_array[1]);
			attribute_list[? "int"] = new Attribute("int", attr_array[2]);
			attribute_list[? "end"] = new Attribute("end", attr_array[3]);
		}
	}
	
	function get_attr(_attr)
	{
		return attribute_list[? _attr].get_value()
	}
	
	function get_attributes()
	{
		return attribute_list
	}
	
	function increment_attr(_attr)
	{
		attribute_list[? _attr].increase(1)
	}
	
	function decrement_attr(_attr)
	{
		attribute_list[? _attr].increase(-1)
	}
}