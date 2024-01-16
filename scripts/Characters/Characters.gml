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
	skills = new Skills();
	skills.init([irandom_range(15,100), irandom_range(15,100), irandom_range(15,100), irandom_range(15,100)])
	party = undefined
	faction = undefined
	weapon = script_execute((choose(CreateSword, CreateBow)))
	level = 1
	armour = script_execute(choose(CreateUnarmoured, CreateLightArmour, CreateMediumArmour, CreateHeavyArmour))
	equipment = new Equipment()
	//inventory = new Inventory()
	max_hp = calculate_max_hp(attributes.get_attr("end").get_value(), level)
	hp = max_hp
	

	
	function equip(_item)
	{
		var tmp = equipment.equip(_item)
		if(tmp.get_name() == "Unarmed" or tmp.get_name() == "Unarmoured")
		{
			delete tmp
		}
		else
		{
			party.get_inventory().add_item(tmp)
		}
	}
	
	function get_skills()
	{
		return skills
	}
	
	function get_level()
	{
		return level
	}
	
	function set_level(_level)
	{
		level = _level
	}
	
	function increase_level()
	{
		level++
	}
	
	function get_armour()
	{
		return equipment.get_armour()
	}
	
	function get_hp()
	{
		return hp
	}
	
	function get_hp_max()
	{
		return max_hp
	}
	
	
	
	function get_hypothetical_hp_max(_end, _level)
	{
		return calculate_max_hp(attributes.get_attr("end").get_value() + _end, level + _level)
	}
	
	function set_max_hp()
	{
		max_hp = calculate_max_hp(attributes.get_attr("end").get_value(), level)
		reset_hp()
	}
	
	function reset_hp()
	{
		hp = max_hp
	}
	
	function modify_hp(_mod)
	{
		hp += _mod
	}
	
	function update_stats()
	{
		set_max_hp()
	}
	
	function get_weapon()
	{
		return equipment.get_weapon()
	}
	
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
	inventory = new Inventory()
	gold = 15000
	
	function get_gold()
	{
		return gold
	}
	
	function add_gold(_amount)
	{
		gold += _amount
	}
	
	function remove_gold(_amount)
	{
		if(_amount <= gold)
		{
			gold -= _amount
			return true
		}
		return false
	}
	
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
	
	function get_inventory()
	{
		return inventory
	}
}

enum COMBATCHARACTERSTATES
{
	IDLE,
	INITIATE_MOVE,
	MOVING,
	ATTACKING,
	DEAD
}
function CombatCharacter(_char) constructor
{
	character = _char;
	tile = undefined;
	xpos = undefined;
	ypos = undefined;
	maxAP = 2;
	currentAP = maxAP;
	state = COMBATCHARACTERSTATES.IDLE
	path = undefined
	pathPos = -1
	dest = undefined
	
	//variable for NPC AI
	targ = noone
	
	function get_skills()
	{
		return character.get_skills()
	}
	
	function get_armour()
	{
		return character.get_armour()
	}
	
	function get_weapon()
	{
		return character.get_weapon()
	}
	
	function get_xpos()
	{
		return xpos
	}
	
	function get_ypos()
	{
		return ypos
	}
	
	function set_xpos(_x)
	{
		xpos = _x
	}
	
	function set_ypos(_y)
	{
		ypos = _y
	}
	
	function set_path(_path)
	{
		path = _path
		pathPos = 0
	}
	
	function get_path()
	{
		return path
	}
	
	function get_path_step()
	{
		return path[pathPos]
	}
	function proceed_on_path()
	{
		pathPos++
		if(pathPos >= array_length(path)) return noone
		return path[pathPos]
	}
	
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
		xpos = tile.get_x() * COMBATCELLSIZE
		ypos = tile.get_y() * COMBATCELLSIZE
	}
	
	function get_tile()
	{
		return tile;
	}
	
	function get_attr(_attr)
	{
		return character.get_attr(_attr)
	}
	
	function get_hp_max()
	{
		return character.get_hp_max()
	}
	
	function get_hp()
	{
		return character.get_hp()
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
	
	function to_init_move()
	{
		state = COMBATCHARACTERSTATES.INITIATE_MOVE
	}
	
	function to_move()
	{
		print("====================")
		print("Moving to MOVE state")
		print("====================")
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
		//character.get_tile().set_occupant(noone)
		state = COMBATCHARACTERSTATES.DEAD
	}
	
	function is_dead()
	{
		return state == COMBATCHARACTERSTATES.DEAD
	}
	
	function damage(dam)
	{
		var total_damage = dam - max(get_armour().get_threshold(), get_armour().get_resistance() * dam)
		if(total_damage < 0) total_damage = 0
		print("HIT for " + string(total_damage))
		character.modify_hp(-(total_damage))
		if(character.get_hp() <= 0) to_dead()
	}
	
	function get_state()
	{
		return state
	}
	
	function get_damage()
	{
		return irandom_range(get_weapon().get_min_damage(), get_weapon().get_max_damage())
	}
	
	function get_attack_range_max()
	{
		return character.get_weapon().get_max_range()
	}
	
	function get_attack_range_min()
	{
		return character.get_weapon().get_min_range()
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
		set_path(dest.get_path())
	}
	
	function get_dest()
	{
		return dest;
	}
	
	function get_hit_chance(_targ)
	{
		return get_weapon().hit_chance(dist_to_targ(get_tile(), _targ.get_tile()))//sqrt(sqr(get_tile().get_x() - _targ.get_tile().get_x()) +
				    //get_tile().get_y() - _targ.get_tile().get_x()))
	}
	
	function get_hit_chance_hypothetical(_tile, _targ)
	{
		return get_weapon().hit_chance(dist_to_targ(_tile, _targ.get_tile()))//sqrt(sqr(get_tile().get_x() - _targ.get_tile().get_x()) +
				    //get_tile().get_y() - _targ.get_tile().get_x()))
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