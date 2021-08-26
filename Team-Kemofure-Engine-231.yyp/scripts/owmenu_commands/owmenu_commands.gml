/// @param contactName
/// @param contactID
/// Adds a contact list
function call_list_add() {
	ds_list_add(obj_overworldmenu.contactNameList, argument[0]);
	ds_list_add(obj_overworldmenu.contactList, argument[1]);
}

/// @param contactID
/// Removes a contact list
function call_list_remove() {
	var menu = obj_overworldmenu;
	ds_list_delete(menu.contactList, ds_list_find_index(menu.contactList, argument[0]));
	ds_list_delete(menu.contactNameList, ds_list_find_index(menu.contactList, argument[0]));
}

/// @param itemID
/// Adds an item to the inventory
function item_add() {
	ds_list_add(global.inv_item, argument[0]);
}

/// @param itemID
/// Removes an item from the inventory
function item_remove() {
	ds_list_delete(global.inv_item, ds_list_find_index(global.inv_item, argument[0]));
}

/// @param itemID
/// Gets the name of an item
function item_get_name() {
	switch (argument[0]) {
		default: return "Unknown Item"; break;
		case "item.consumables.monstercandy": return lang_raw("item.consumables.monstercandy.name", global.itemjson); break;
	}
}

/// @param itemID
/// Gets the info of an item
function item_get_info() {
	switch (argument[0]) {
		default: return "Unknown Item"; break;
		case "item.consumables.monstercandy": return [20, true]; break;
	}
}
