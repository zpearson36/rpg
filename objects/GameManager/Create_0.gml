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
enemy_party = new Party()
enemy_party.add_member(new Character())
enemy_party.add_member(new Character())
state = GameStates.MAINMENU
fight_manager = instance_create_layer(x, y, layer, FightManager)
world_manager = instance_create_layer(x, y, layer, WorldManager)
faction_manager = new FactionManager()

player_faction = new Faction("good")
player_faction.add_member(pc_party.get_members()[0])
player_faction.add_member(pc_party.get_members()[1])
enemy_faction  = new Faction("baad")
enemy_faction.add_member(enemy_party.get_members()[0])
enemy_faction.add_member(enemy_party.get_members()[1])

faction_manager.add_faction(player_faction)
faction_manager.add_faction(enemy_faction)
faction_manager.set_relation(player_faction, enemy_faction, -100)