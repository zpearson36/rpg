switch(state)
{
	case GameStates.MAINMENU:
	{
		state = GameStates.WORLD
		break;
	}
	case GameStates.WORLD:
	{
		world_manager.activate(pc)
		if(keyboard_check_pressed(vk_space))
		{
			world_manager.deactivate()
			state = GameStates.COMBAT
			fight_manager.activate(pc_party.get_members(), enemy_party.get_members())
		}
		break;
	}
	case GameStates.COMBAT:
	{
		if(keyboard_check_pressed(vk_space))
		{
			fight_manager.deactivate()
			state = GameStates.WORLD
		}
		if(mouse_check_button_pressed(mb_middle))
		{
			var mx = floor(mouse_x / COMBATCELLSIZE)
			var my = floor(mouse_y / COMBATCELLSIZE)
			var ter = ClearTerrain()
			switch(fight_manager.get_grid().get_cell(mx, my).get_terrain().get_type())
			{
				case TerrainType.CLEAR:       {ter = MuddyTerrain();        break;}
				case TerrainType.MUDDY:       {ter = ShallowWaterTerrain(); break;}
				case TerrainType.SHALLOWWATER:{ter = ClearTerrain();        break;}
			}
			
			fight_manager.get_grid().get_cell(mx, my).set_terrain(ter)
		}
		if(fight_manager.get_state() == FMStates.INACTIVE)
			state = GameStates.WORLD
		break;
	}
}
//show_debug_message(ds_grid_height(FactionManager.faction_grid))