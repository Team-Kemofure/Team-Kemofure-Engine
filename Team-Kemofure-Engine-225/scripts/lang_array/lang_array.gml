/// @param arrayid
/// Gets the array from the localization file

var decoded = ds_map_find_value(global.localization, argument[0]);
var generated = [];

for (var i = 0; i < ds_list_size(decoded); i++) {
	var value = decoded[| i]
	//generated[i] = array_get(value[0]);
	show_debug_message(value[? i]);
}

return generated;