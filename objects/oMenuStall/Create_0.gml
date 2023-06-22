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
stall = undefined
//menu functions
function to_buy() {manager.set_menu(oMenuStallBuy, [stall])}
function to_sell()  {manager.set_menu(oMenuStallSell, [stall])}
function to_close()  {manager.close()}

//first level options
options[0] = ["Buy", to_buy]
options[1] = ["Sell", to_sell]
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