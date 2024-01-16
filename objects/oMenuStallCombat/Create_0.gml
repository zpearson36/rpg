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
sc_space = 10
sc_height = 115
manager = undefined
options = []
stall = undefined
scroll_offset = 0
number_per_page = 4
scenarios = [
new Encounter([1, 0, 0, 0, 0]),
new Encounter([2, 1, 0, 0, 0]),
new Encounter([3, 0, 1, 0, 0]),
new Encounter([4, 0, 0, 1, 0]),
new Encounter([5, 0, 0, 0, 1])
]
scroll_hover_up = false
scroll_hover_down = false
//menu functions
function to_close()  {manager.close()}

//first level options
options[0] = ""
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
options[12] = ["Exit", to_close]

options_list = 0
currently_selected = 0
side_menu = false
char_menu = false
party = GameManager.get_player_party()

function set_manager(_manager)
{
	manager = _manager
}

function set_args(_args)
{
	stall = _args[0]
}