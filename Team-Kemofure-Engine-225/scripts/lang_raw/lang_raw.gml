/// @param stringid
/// Gets the string from the localization file

var value = ds_map_find_value(global.localization, argument[0]);
if (is_string(value))
	return value;
else
	show_error("Error! String ID with the name\"" + argument[0] + "\" not found.", true);