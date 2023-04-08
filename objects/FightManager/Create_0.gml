enum FMStates
{
	INIT,
	SETUP,
	RUNNING,
	COMBATFINISHED,
	DEACTIVATING,
	INACTIVE
}

state = FMStates.INACTIVE
character = undefined
party = undefined
grid = undefined
units = []
function get_state()
{
	return state;
}
function activate()
{
	if(state == FMStates.INACTIVE)
	{
		for(var k = 0; k < argument_count; k++)
		{
			for(var i = 0; i < array_length(argument[k]); i++)
			{
				units[k][i] = new CombatCharacter(argument[k][i])
			}
		}
		party = 0
		character = 0
		state = FMStates.INIT
	}
}
function deactivate()
{
	state = FMStates.DEACTIVATING
}

function get_character()
{
	return units[party][character];
}

function next_party()
{
	party++;
	if(party == array_length(units)) party = 0
	for(var i = 0; i < array_length(units[party]); i++)
	{
		units[party][i].reset_ap()
	}
}

gui = instance_create_layer(x, y, "Instances", FightGUI)