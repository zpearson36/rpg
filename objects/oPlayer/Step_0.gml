var interaction = collision_rectangle(character.get_x(), character.get_y(),
				                   character.get_x() + 64, character.get_y() + 64,
								   oInteractBubble, true, false)
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
				
				
				if(interaction)
				{
					interaction.display_prompt()
					if(keyboard_check_pressed(vk_space))
					{
						interaction.interact(self)
					}
				}
				if(keyboard_check(ord("D")))
				{
					character.set_state(PCStates.MOVING);
					xSpd = spd;
				}
				else if(keyboard_check(ord("W")))
				{
					character.set_state(PCStates.MOVING);
					ySpd = -spd;
				}
				else if(keyboard_check(ord("S")))
				{
					character.set_state(PCStates.MOVING);
					ySpd = spd;
				}
				else if(keyboard_check(ord("A")))
				{
					character.set_state(PCStates.MOVING);
					xSpd = -spd;
				}
				break;
			}
			case PCStates.MOVING:
			{
				var col = collision_rectangle(character.get_x() + xSpd, character.get_y() + ySpd,
				                              character.get_x() + 64 + xSpd, character.get_y() + 64 + ySpd,
											  oCollidable, true, false)
				if(col)
				{
				    xSpd = 0
					ySpd = 0
				}
				
				
				if(interaction)
				{
					interaction.display_prompt()
					if(keyboard_check_pressed(vk_space))
					{
						interaction.interact(self)
					}
				}
				if(   keyboard_check_released(ord("D"))
				   or keyboard_check_released(ord("S"))
				   or keyboard_check_released(ord("A"))
				   or keyboard_check_released(ord("W")))
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

