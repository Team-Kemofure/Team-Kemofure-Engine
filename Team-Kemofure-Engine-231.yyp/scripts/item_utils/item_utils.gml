
/// @param itemPos
/// Gets the item ID from an item position
function item_get_id() {
	return ds_list_find_value(global.playerinv, argument[0]);
}

/// @param itemID
/// Adds an item to the inventory
function item_add() {
	ds_list_add(global.playerinv, argument[0]);
}

/// @param itemPos
/// Removes an item from the inventory
function item_remove() {
	ds_list_delete(global.playerinv, argument[0]);
}

/// @param itemID
/// Gets the name of an item
function item_get_name() {
	switch (argument[0]) {
		default: return "Nothing"; break;
		case ITEM.MONSTER_CANDY: return "Monster Candy"; break;
		case ITEM.BUTTERSCOTCH_PIE: return "Butterscotch Pie"; break;
	}
}

/// @param itemID
/// Gets the info of an item
function item_get_info() {
	switch (argument[0]) {
		default: return {hp : 0, special : false, price : 0, keyName : undefined}; break;
		case ITEM.MONSTER_CANDY: return {hp : 10, special : false, price : 3, keyName : "monstercandy"}; break;
		case ITEM.BUTTERSCOTCH_PIE: return {hp : 100, special : false, price : 10, keyName : "butterscotch_pie"}; break;
	}
}