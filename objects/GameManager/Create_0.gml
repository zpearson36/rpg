enum GameStates
{
	MAINMENU,
	WORLD,
	COMBAT
}
pc = new Character()
pc.set_name("tubficker")
state = GameStates.MAINMENU
fight_manager = instance_create_layer(x, y, layer, FightManager)
world_manager = instance_create_layer(x, y, layer, WorldManager)