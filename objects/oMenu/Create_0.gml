/// @description Insert description here
// You can write your code in this editor\
x = 50
y = 50
state = 1

w = 640
h = 512
width = 256
height = 512
op_border = 25
op_space = 25
manager = undefined
options = []
//menu functions
function to_characters() {manager.set_menu(oMenuCharacterSelect, [oMenuCharacterStats])}
function to_inventory()  {}//{manager.set_menu(oMenuCharacters)}
function to_equipment()  {manager.set_menu(oMenuCharacterSelect, [oMenuCharacterEquipment])}

//first level options
options[0] = ["Characters", to_characters]
options[1] = ["Inventory", to_inventory]
options[2] = ["Equipment", to_equipment]
options[3] = ["Exit", game_end]

options_list = 0
currently_selected = 0
side_menu = false
char_menu = false
party = GameManager.get_player_party()
//Characters options
//options[1][0] = ["Back", to_main]

//inventory options
//options[2][0] = ["Back", to_main]

//equipment options
//options[3][0] = ["Back", to_main]

function set_manager(_manager)
{
	manager = _manager
}

function set_args(_args)
{
	return
}
/*
//character options
options[4][0] = ["Back", to_characters]

//character Equipment options
options[5][0] = ["Back", to_equipment]

//Choose to Equip options
options[6][0] = ["Back", to_equipment]

//op_length = array_length(options[0])


party = undefined
function set_party(_party)
{
	party = _party
}
selected_character = noone
selected_equipment = noone
select_character = false
select_equipment = false*/