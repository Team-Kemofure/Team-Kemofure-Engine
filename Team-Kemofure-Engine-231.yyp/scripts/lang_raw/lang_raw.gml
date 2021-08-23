/// Gets the string from the localization file
function lang_raw(stringid, variable) {
	var value = variable_struct_get(variable, stringid);
	return value;
}
