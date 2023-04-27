/// @description Insert description here
// You can write your code in this editor
enum FIGHTGUISTATES
{
	ACTIVE,
	INACTIVE
}

state = FIGHTGUISTATES.INACTIVE
fight_manager = undefined

function activateGUI(_mgr)
{
	fight_manager = _mgr
	state = FIGHTGUISTATES.ACTIVE
}

function deactivateGUI()
{
	state = FIGHTGUISTATES.INACTIVE
}
