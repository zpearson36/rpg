/// @description Insert description here
// You can write your code in this editor
enum MENUSTATES
{
	ACTIVE,
	INACTIVE
}
x = 50
y = 50
state = MENUSTATES.INACTIVE

w = 640
h = 512
width = 256
height = 512
op_border = 25
op_space = 25

options = []
//menu functions
function to_main()      {options_list = 0}
function to_party()     {options_list = 1}
function to_inventory() {options_list = 2}
function to_equipment() {options_list = 3}

//first level options
options[0][0] = ["Party", to_party]
options[0][1] = ["Inventory", to_inventory]
options[0][2] = ["Equipment", to_equipment]
options[0][3] = ["Exit", game_end]

//party options
options[1][0] = ["Back", to_main]

//inventory options
options[2][0] = ["Back", to_main]

//equipment options
options[3][0] = ["Back", to_main]

op_length = array_length(options[0])

currently_selected = 0
options_list = 0

party = undefined
function set_party(_party)
{
	party = _party
}


