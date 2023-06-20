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
stall = undefined
function back() {manager.set_menu(oMenuStall, [stall])}

//first level options
options[0] = ["Back", back]

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
	stall = _args[0]
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