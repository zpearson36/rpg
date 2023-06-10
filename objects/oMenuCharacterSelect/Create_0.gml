/// @description Insert description here
// You can write your code in this editor
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
party = GameManager.get_player_party()

options = []
//menu functions
function back() {manager.set_menu(oMenu)}


options_list = 0
currently_selected = 0
side_menu = false
char_menu = false
//Characters options
options[0] = ["Back", back]
next_menu = undefined
function set_manager(_manager)
{
	manager = _manager
}

function set_args(_args)
{
	next_menu = _args[0]
}