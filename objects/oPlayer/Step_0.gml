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
				character.get_character().set_char_action(STANDING)
                character.get_character().set_action_length(0)
                character.get_character().set_frame_zero()
				
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
                    alarm[0] = character.get_character().get_frame_speed()
                    character.get_character().set_facing(DIRECTION.RIGHT)
					character.set_state(PCStates.MOVING);
					xSpd = spd;
				}
				else if(keyboard_check(ord("W")))
				{
                    alarm[0] = character.get_character().get_frame_speed()
                    character.get_character().set_facing(DIRECTION.UP)
					character.set_state(PCStates.MOVING);
					ySpd = -spd;
				}
				else if(keyboard_check(ord("S")))
				{
                    alarm[0] = character.get_character().get_frame_speed()
                    character.get_character().set_facing(DIRECTION.DOWN)
					character.set_state(PCStates.MOVING);
					ySpd = spd;
				}
				else if(keyboard_check(ord("A")))
				{
                    alarm[0] = character.get_character().get_frame_speed()
                    character.get_character().set_facing(DIRECTION.LEFT)
					character.set_state(PCStates.MOVING);
					xSpd = -spd;
				}
				break;
			}
			case PCStates.MOVING:
			{
				character.get_character().set_char_action(WALK)
                character.get_character().set_action_length(WALK_LENGTH)
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

