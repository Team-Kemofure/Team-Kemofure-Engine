/// Gets the array from the localization file
function lang_array(arrayid, variable) {
	var decoded = lang_raw(arrayid, variable);
	var generated = [];
	
	for (var i = 0; i < array_length(decoded); i++)
		generated[i] = decoded[i];
	return generated;
}
