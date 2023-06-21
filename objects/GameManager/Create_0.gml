randomize()
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
enemy_party.get_members()[0].set_sprite(sTmp10)
enemy_party.get_members()[1].set_sprite(sTmp10)
FactionManager.add_faction(player_faction)
FactionManager.add_faction(enemy_faction)
FactionManager.set_relation(player_faction, enemy_faction, -100)
function get_player_faction()
{
	return player_faction
}

function get_player_party()
{
	return pc_party
}
menu_manager = instance_create_layer(x, y, "Menus", oMenuManager)
//menu_manager.open()

//menu.set_party(pc_party)

function to_combat()
{
	menu_manager.close()
	world_manager.deactivate()
	state = GameStates.COMBAT
	fight_manager.activate(pc_party.get_members(), enemy_party.get_members())
}

function exit_combat()
{
	fight_manager.deactivate()
	state = GameStates.WORLD
}
