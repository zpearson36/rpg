enum PCStates
{
	IDLE,
	MOVING
}
character = noone;
manager   = undefined;
spd       = 5;
xSpd      = 0;
ySpd      = 0;

facing = DIRECTION.DOWN
action = STANDING
action_length = 0
frame = 0
frame_speed = 4


function set_char(_char)
{
	character = _char;
}

function get_char()
{
	return character
}

function set_manager(_man)
{
	manager = _man
}

function get_manager()
{
	return manager
}
