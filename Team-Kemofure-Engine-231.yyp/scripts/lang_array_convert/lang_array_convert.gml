/// @param array
/// Gets the array from the localization file
function lang_array_convert() {
	var array = argument[0];
	var generated = [];
	for (var i = 0; i < array_length(array); i++)
		generated[i][0] = array[i][0];
	return generated;
}
