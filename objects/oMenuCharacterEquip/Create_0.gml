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
character = undefined

options = []
//menu functions
function back() {manager.set_menu(oMenuCharacterEquipment, [character])}
function unequip()
{
	if(equipment_type == ItemTypes.WEAPON)
	{
		character.equip(CreateUnarmed())
	}
	if(equipment_type == ItemTypes.ARMOUR)
	{
		character.equip(CreateUnarmoured())
	}
	back()
}
options_list = 0
currently_selected = 0
side_menu = false
char_menu = false
//Characters options
options[0] = ["Unequip", unequip]
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
character = undefined
equipment_list = undefined
equipment_type = undefined
function set_manager(_manager)
{
	manager = _manager
}

function set_args(_args)
{
	character = _args[0]
	equipment_list = _args[1]
	equipment_type = _args[2]
}