if(character != noone)
{
	draw_sprite(character.get_sprite(), 
	    OFFSET_MULTIPLIER * 
		    (character.get_character().get_char_action() + character.get_character().get_facing())
			+ character.get_character().get_frame(),
		character.get_x(), character.get_y())
}