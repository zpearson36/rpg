function gen_id_char()
{
	static char = 0;
	char++;
	return char;
}

function Character() constructor
{
	//Static variables to keep track of all characters
	static charCount = 0;
	static charArray = [noone];
	charCount++;
	charArray[charCount] = self;
	
	//Character specific variables
	charID = gen_id_char();
	name = undefined;
	sprite = undefined;
	
	function set_name(_name)
	{
		name = _name;
	}
	
	function get_name()
	{
		return name;
	}
	
	function set_sprite(_sprite)
	{
		sprite = _sprite;
	}
	
	function get_sprite()
	{
		return sprite;
	}
}