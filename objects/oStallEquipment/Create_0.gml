/// @description Insert description here
// You can write your code in this editor
event_inherited()
bub = instance_create_layer(x, y, layer, oInteractBubble)
bub.stall = self
active = false

inventory = new Inventory()
inventory.add_item(CreateBow())
inventory.add_item(CreateBow())
inventory.add_item(CreateSword())
inventory.add_item(CreateSword())
inventory.add_item(CreateSpear())
inventory.add_item(CreateSpear())
inventory.add_item(CreateLightArmour())
inventory.add_item(CreateLightArmour())
inventory.add_item(CreateMediumArmour())
inventory.add_item(CreateMediumArmour())
inventory.add_item(CreateHeavyArmour())
inventory.add_item(CreateHeavyArmour())
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
	GameManager.get_menu_manager().open(oMenuStall, [self])
}

function get_inventory()
{
	return inventory
}