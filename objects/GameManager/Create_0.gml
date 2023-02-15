/// @description Insert description here
// You can write your code in this editor
/*
randomize()
grid = new CombatGrid()
grid.init()
tmp = new Character()
tmp2 = new CombatCharacter(tmp)
tmp2.set_sprite(sTmp)
grid.get_cell(irandom(COMBATGRIDWIDTH) - 1, irandom(COMBATGRIDHEIGHT) -1).set_occupant(tmp2)
*/



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