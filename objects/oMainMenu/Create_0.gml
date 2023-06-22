/// @description Insert description here
// You can write your code in this editor
options = []
//menu functions
function create_character() {room_goto(Game)}
function to_load()  {}

//menu options
options[0] = ["New Game", create_character]
options[1] = ["Load", to_load]
options[2] = ["Quit", game_end]

op_lborder = 25
op_bborder = 50
op_space  = 10

currently_selected = -1
