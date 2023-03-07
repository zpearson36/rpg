enum GameStates
{
	MAINMENU,
	WORLD,
	COMBAT
}
pc = new Character()
pc.set_name("tubficker")
pc_party = new Party()
pc_party.add_member(pc)
pc_party.add_member(new Character())
state = GameStates.MAINMENU
fight_manager = instance_create_layer(x, y, layer, FightManager)
world_manager = instance_create_layer(x, y, layer, WorldManager)
faction_manager = new FactionManager()