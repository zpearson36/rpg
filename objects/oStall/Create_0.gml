/// @description Insert description here
// You can write your code in this editor
event_inherited()
bub = instance_create_layer(x, y, layer, oInteractBubble)
bub.stall = self
active = false

function activate()
{
	active = true
}

function deactivate()
{
	active = false
}

menu_manager = instance_create_layer(x, y, "Menus", oMenuManager)

function interact(_obj)
{
	menu_manager.open(oMenuStall)
}