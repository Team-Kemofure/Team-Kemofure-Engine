/// @param arrayid
/// Gets the array from the localization file
function lang_array() {
	var decoded = lang_raw(argument[0]);
	var generated = [];
	
	for (var i = 0; i < array_length(decoded); i++)
		generated[i] = decoded[i];
	return generated;
}
