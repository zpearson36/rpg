/// @description Insert description here
// You can write your code in this editor

event_inherited()
bub = instance_create_layer(x, y, layer, oInteractBubble)
bub.stall = self
active = false

inventory = new Inventory()

function activate()
{
	active = true
}

function deactivate()
{
	active = false
}

function interact(_obj)
{
	print(self)
	print(oMenuStallCombat)
	GameManager.get_menu_manager().open(oMenuStallCombat, [self])
}

function get_inventory()
{
	return inventory
}