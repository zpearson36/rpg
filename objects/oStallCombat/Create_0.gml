/// @description Insert description here
// You can write your code in this editor

event_inherited()
bub = instance_create_layer(x, y, layer, oInteractBubble)
bub.stall = self
active = false

inventory = new Inventory()

function activate()
{
	print("Poo poo fuck pie")
	active = true
}

function deactivate()
{
	active = false
}

menu_manager = instance_create_layer(x, y, "Menus", oMenuManager)

function interact(_obj)
{
	menu_manager.open(oMenuStallCombat, [self])
	//GameManager.to_combat()
}

function get_inventory()
{
	return inventory
}