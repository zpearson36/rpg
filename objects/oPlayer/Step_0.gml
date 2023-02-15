if(manager.get_state() == WMStates.RUNNING)
{
	if(character != noone)
	{
		switch(character.get_state())
		{
			case undefined:
			{
				character.set_state(PCStates.IDLE);
				break;
			}
			case PCStates.IDLE:
			{
				
				xSpd = 0;
				ySpd = 0;
				if(keyboard_check(vk_right))
				{
					character.set_state(PCStates.MOVING);
					xSpd = spd;
				}
				else if(keyboard_check(vk_up))
				{
					character.set_state(PCStates.MOVING);
					ySpd = -spd;
				}
				else if(keyboard_check(vk_down))
				{
					character.set_state(PCStates.MOVING);
					ySpd = spd;
				}
				else if(keyboard_check(vk_left))
				{
					character.set_state(PCStates.MOVING);
					xSpd = -spd;
				}
				break;
			}
			case PCStates.MOVING:
			{
				if(keyboard_check_released(vk_right)
				   or keyboard_check_released(vk_up)
				   or keyboard_check_released(vk_down)
				   or keyboard_check_released(vk_left))
				{
					character.set_state(PCStates.IDLE);
					break;
				}
				character.set_x(character.get_x() + xSpd);
				character.set_y(character.get_y() + ySpd);
				break;
			}
		}
	}
}