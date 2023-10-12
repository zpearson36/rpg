/// @description Insert description here
// You can write your code in this editor
switch(state)
{
	case FMStates.INIT:
	{
		break;
	}
	case FMStates.SETUP:
	{
		break;
	}
	case FMStates.RUNNING:
	{
		if(units[party][character].get_faction() != GameManager.player_faction)
		{
			draw_set_color(c_red)
			draw_set_alpha(.5)
			draw_rectangle(display_get_gui_width() div 4, 25,display_get_gui_width() - (display_get_gui_width() div 4), 75, false)
			draw_set_alpha(1)
			draw_rectangle(display_get_gui_width() div 4, 25,display_get_gui_width() - (display_get_gui_width() div 4), 75, true)
			draw_set_color(c_white)
			draw_set_font(fnt_prompt)
			draw_text((display_get_gui_width() div 2), 55, "Enemy Turn")
			draw_set_font(-1)
		}
		break;
	}
	case FMStates.COMBATFINISHED:
	{
		break
	}
	case FMStates.DEACTIVATING:
	{
		break;
	}
	case FMStates.INACTIVE:
	{
		break;
	}
}