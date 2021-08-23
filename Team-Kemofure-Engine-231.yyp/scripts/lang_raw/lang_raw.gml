/// @param stringid
/// Gets the string from the localization file
function lang_raw() {
	var value = variable_struct_get(global.localization, argument[0]);
	return value;
}
