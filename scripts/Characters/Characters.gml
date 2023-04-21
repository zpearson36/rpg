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
	sprite = sTmp;
	attributes = new Attributes();
	attributes.init()
	party = undefined
	faction = undefined
	
	function set_faction(_faction)
	{
		faction = _faction
	}
	
	function get_faction()
	{
		return faction
	}
	
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
	
	function add_party(_party)
	{
		party = _party
	}
	
	function remove_party()
	{
		party.remove_member(self)
		party = undefined
	}
}

function Party() constructor
{
	members = [];
	
	function add_member(_char)
	{
		members[array_length(members)] = _char
		_char.add_party(self)
	}
	
	function get_members()
	{
		return members
	}
	
	function remove_member(_char)
	{
		members = array_delete_index(members, array_get_index(members, _char))
	}
}

enum COMBATCHARACTERSTATES
{
	IDLE,
	MOVING,
	ATTACKING,
	DEAD
}
function CombatCharacter(_char) constructor
{
	character = _char;
	tile = undefined;
	maxAP = 2;
	currentAP = maxAP;
	state = COMBATCHARACTERSTATES.IDLE
	
	//variable for NPC AI
	targ = noone
	dest = undefined
	
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
	
	function reset_ap()
	{
		currentAP = maxAP
	}
	
	function empty_ap()
	{
		currentAP = 0
	}
	
	function to_idle()
	{
		state = COMBATCHARACTERSTATES.IDLE
	}
	
	function to_move()
	{
		state = COMBATCHARACTERSTATES.MOVING
	}
	
	function to_attack()
	{
		state = COMBATCHARACTERSTATES.ATTACKING
	}
	
	function to_dead()
	{
		set_sprite(sTmpDead)
		character.remove_party()
		state = COMBATCHARACTERSTATES.DEAD
	}
	
	function is_dead()
	{
		return state == COMBATCHARACTERSTATES.DEAD
	}
	
	function damage()
	{
		print("HIT")
		to_dead()
	}
	
	function get_state()
	{
		return state
	}
	
	function get_attack_range_max()
	{
		return 3
	}
	
	function get_attack_range_min()
	{
		return 1
	}
	
	function get_faction()
	{
		return character.get_faction()
	}
	
	
	//AI Functions
	function set_targ(_targ)
	{
		targ = _targ;
	}
	
	function get_targ()
	{
		return targ;
	}
	
	function set_dest(_dest)
	{
		dest = _dest;
	}
	
	function get_dest()
	{
		return dest;
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