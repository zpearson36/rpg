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

//scrollbar variables
scroll_hover_up = false
scroll_hover_down = false
scroll_offset = 0
stall = undefined
//menu functions
function back() {manager.set_menu(oMenuStall, [stall])}

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
options[12] = ["Back", back]
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