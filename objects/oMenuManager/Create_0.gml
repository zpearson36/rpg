/// @description Insert description here
// You can write your code in this editor
menu = undefined

function remove_menu()
{
	if(menu != undefined) instance_destroy(menu)
	menu = undefined
}
function set_menu(_menu, _char=[])
{
	remove_menu()
	menu = instance_create_layer(x, y, layer, _menu)
	menu.set_args(_char)
	menu.set_manager(self)
}

function open(_menu)
{
	set_menu(_menu)
}

function close()
{
	remove_menu()
}

function is_open()
{
	return menu != undefined
}