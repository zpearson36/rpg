/// @description Insert description here
// You can write your code in this editor
enum FMStates
{
	INIT,
	SETUP,
	RUNNING,
	DEACTIVATING,
	INACTIVE
}

state = FMStates.INACTIVE
character = undefined
grid = undefined
function get_state()
{
	return state;
}
function activate(_player)
{
	if(state == FMStates.INACTIVE)
	{
		character = new CombatCharacter(_player)
		state = FMStates.INIT
	}
}
function deactivate()
{
	state = FMStates.DEACTIVATING
}