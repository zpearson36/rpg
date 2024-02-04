//randomize()
enum GameStates
{
	MAINMENU,
	WORLD,
	COMBAT
}
pc = new Character()
pc.set_name("tubficker")

player_faction = new Faction("good")
pc_party = new Party()
pc_party.add_member(pc)
pc_party.add_member(new Character())
pc_party.add_member(new Character())
pc_party.add_member(new Character())
player_faction.add_member(pc_party.get_members()[0])
player_faction.add_member(pc_party.get_members()[1])
player_faction.add_member(pc_party.get_members()[2])
player_faction.add_member(pc_party.get_members()[3])

enemy_faction  = new Faction("baad")
enemy_party = new Party()
enemy_party.add_member(new Character())
enemy_party.add_member(new Character())
enemy_faction.add_member(enemy_party.get_members()[0])
enemy_faction.add_member(enemy_party.get_members()[1])
enemy_party.get_members()[0].set_sprite(sChar)
enemy_party.get_members()[1].set_sprite(sChar)

state = GameStates.MAINMENU
fight_manager = instance_create_layer(x, y, layer, FightManager)
world_manager = instance_create_layer(x, y, layer, WorldManager)
faction_manager = new FactionManager()
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
function to_combat(scenario)
{
	menu_manager.close()
	world_manager.deactivate()
	state = GameStates.COMBAT
	room_goto(CombatRoom)
	var enemy_party = new Party()
	var index = 0
	for(var i = 0; i < array_length(scenario.get_enemy_count()); i++)
	{
		for(var j = 0; j < scenario.get_enemy_count()[i]; j++)
		{
			enemy_party.add_member(new Character())
			enemy_faction.add_member(enemy_party.get_members()[index])
			enemy_party.get_members()[i+j].set_sprite(sGoblin)
			index++
		}
	}
	
	fight_manager.activate(scenario.get_encounter_level(), pc_party.get_members(), enemy_party.get_members())
}

function exit_combat()
{
	fight_manager.deactivate()
	state = GameStates.WORLD
}

function to_world()
{
	state = GameStates.WORLD
}

function get_menu_manager()
{
	return menu_manager
}