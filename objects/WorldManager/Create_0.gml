/// @description Insert description here
// You can write your code in this editor
player = undefined;
function set_character(_char)
{
	player = instance_create_layer(0, 0, "Instances", oPlayer)
	player.set_char(new WorldCharacter(_char, 50, 50))
	player.get_char().set_sprite(sTmp)
	player.set_manager(self)
}

enum WMStates
{
	INIT,
	SETUP,
	RUNNING,
	DEACTIVATING,
	INACTIVE
}

state = WMStates.INACTIVE
num = 0
function get_state()
{
	return state;
}

function activate(_player)
{
	show_debug_message("Fuckoff")
	if(state == WMStates.INACTIVE)
	{
		set_character(_player)
		state = WMStates.INIT
	}
	
	show_debug_message("IHATEYOU")
}
function deactivate()
{
	state = WMStates.DEACTIVATING
}