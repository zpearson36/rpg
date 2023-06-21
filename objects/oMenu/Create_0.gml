/// @description Insert description here
// You can write your code in this editor\
x = 50
y = 50
state = 1

//left side menu sizes
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
options = []
//menu functions
function to_characters() {manager.set_menu(oMenuCharacterSelect, [oMenuCharacterStats])}
function to_inventory()  {}//{manager.set_menu(oMenuCharacters)}
function to_close()  {manager.close()}
function to_equipment()  {manager.set_menu(oMenuCharacterSelect, [oMenuCharacterEquipment])}

//first level options - empty string indicates unused option.
options[0] = ["Characters", to_characters]
options[1] = ["Inventory", to_inventory]
options[2] = ["Equipment", to_equipment]
options[3] = ""
options[4] = ""
options[5] = ""
options[6] = ""
options[7] = ""
options[8] = ""
options[9] = ""
options[10] = ""
options[11] = ["Exit", to_close]
options[12] = ["Quit Game", game_end]

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