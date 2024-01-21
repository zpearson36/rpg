/// @description Insert description here
// You can write your code in this editor
x = 50
y = 50
state = 1

w = 640
h = 512
//right side top menu sizes
width = 256
height = 384
//right side bottom menu sizes
widthb = 256
heightb = 128
op_border = 25
op_space = 25
manager = undefined
party = GameManager.get_player_party()
character = undefined

options = []
//menu functions
function back() {manager.set_menu(oMenuStallLevelUp, [oMenuCharacterLevelUp])}
function levelup()
{
	if((attributes.total_attr_points() or total_skill_cost) and party.remove_gold(get_attribute_cost() + total_skill_cost))
	{
		character.get_attrs().get_attr("str").increase(attributes.get_attr("str").get_value())
		character.get_attrs().get_attr("end").increase(attributes.get_attr("end").get_value())
		character.get_attrs().get_attr("spd").increase(attributes.get_attr("spd").get_value())
		character.get_attrs().get_attr("int").increase(attributes.get_attr("int").get_value())
		character.set_level(character.get_level() + attributes.total_attr_points())
		attributes.init([0,0,0,0])
		var c_skills = character.get_skills()
		var c_skills_keys = []
		ds_map_keys_to_array(c_skills.get_skills(), c_skills_keys)
		for(var i = 0; i < ds_map_size(skills.get_skills()); i++)
		{
			var c_skill = c_skills.get_skill(c_skills_keys[i])
			var n_skill = skills.get_skill(c_skills_keys[i])
			c_skill.set_value(c_skill.get_value() + n_skill.get_value())
		}
		character.update_stats()
		skills.init()
	}
}
options_list = 0
currently_selected = 0
side_menu = false
char_menu = false

attributes = new Attributes()
attributes.init([0,0,0,0,0])
skills = new Skills()
cost_per_skill = 50
total_skill_cost = 0
//Characters options
options[0] = ["Buy", levelup]
options[1] = ""
options[2] = ""
options[3] = ""
options[4] = ""
options[5] = ""
options[6] = ""
options[7] = ""
options[8] = ""
options[9] = ""
options[10] = ""
options[11] = ""
options[12] = ["Back", back]

function set_manager(_manager)
{
	manager = _manager
}

function set_args(_args)
{
	character = _args[0]
}

function get_attribute_cost(_offset = 0)
{
	var total = 0
	for(var i = 0; i < attributes.total_attr_points() + _offset; i++)
	{
		total += attribute_cost(character.get_attrs().total_attr_points() + i)
	}
	return total
}

function get_skill_cost(_skill)
{
	var total = 0
	var n_val = skills.get_skill(_skill).get_value()
	var c_val = character.get_skills().get_skill(_skill).get_value()
	
	for(var i = c_val; i < n_val + c_val; i++)
	{
		total += 50 + .005 * power(n_val + c_val + 1, 3) + .001 * power(n_val + c_val + 1, 2)
	}
	return total
}

function get_cost_of_next_skill(_skill)
{
	var n_val = skills.get_skill(_skill).get_value()
	var c_val = character.get_skills().get_skill(_skill).get_value()
	return 50 + .005 * power(n_val + c_val + 1, 3) + .001 * power(n_val + c_val + 1, 2)
}