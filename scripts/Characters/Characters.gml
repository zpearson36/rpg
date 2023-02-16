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
	attributes = new Attributes();
	attributes.init()
	
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
	
	function get_attrs()
	{
		return attributes;
	}
	
	function get_attr(_attr)
	{
		return attributes.get_attr(_attr)
	}
}

function CombatCharacter(_char) constructor
{
	character = _char;
	tile = undefined;
	maxAP = 2;
	currentAP = maxAP;
	
	function set_sprite(_sprite)
	{
		character.set_sprite(_sprite);
	}
	
	function get_sprite()
	{
		return character.get_sprite();
	}
	
	function set_tile(_tile)
	{
		tile = _tile;
	}
	
	function get_tile()
	{
		return tile;
	}
	
	function get_attr(_attr)
	{
		return character.get_attr(_attr)
	}
	
	function get_ap_max()
	{
		return maxAP
	}
	
	function get_ap()
	{
		return currentAP
	}
	
	function spend_ap()
	{
		currentAP -= 1
	}
}

function WorldCharacter(_char, _x, _y) constructor
{
	character = _char;
	pos_x = _x;
	pos_y = _y;
	state = undefined
	
	function set_sprite(_sprite)
	{
		character.set_sprite(_sprite);
	}
	
	function get_sprite()
	{
		return character.get_sprite();
	}
	
	function get_x()
	{
		return pos_x
	}
	
	function get_y()
	{
		return pos_y
	}
	
	function set_x(_x)
	{
		pos_x = _x
	}
	
	function set_y(_y)
	{
		pos_y = _y
	}
	
	function get_state()
	{
		return state;
	}
	
	function set_state(_state)
	{
		state = _state;
	}
}