/// @description Insert description here
// You can write your code in this editor
player = undefined;
show_debug_message("SHIT")
function set_character(_char)
{
	player = instance_create_layer(0, 0, layer, oPlayer)
	player.set_char(new WorldCharacter(_char, 50, 50))
	player.get_char().set_sprite(sTmp)
	player.set_manager(self)
}

enum WMStates
{
	INIT,
	SETUP,
	RUNNING,
}

state = WMStates.INIT

function get_state()
{
	return state;
}