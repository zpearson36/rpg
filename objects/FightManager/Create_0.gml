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
units = []
function get_state()
{
	return state;
}
function activate(_party)
{
	if(state == FMStates.INACTIVE)
	{
		for(var i = 0; i < array_length(_party); i++)
		{
			units[i] = new CombatCharacter(_party[i])
		}
		character = 0
		state = FMStates.INIT
	}
}
function deactivate()
{
	state = FMStates.DEACTIVATING
}