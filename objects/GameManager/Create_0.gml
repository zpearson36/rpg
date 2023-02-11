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

tmp = new Character()
tmp2 = new WorldCharacter(tmp, 50, 50)
tmp2.set_sprite(sTmp)