/// @param fname
/// Loads a JSON file and returns a value of a DS map
function json_load() {
	var fname = "data/" + argument[0] + ".json";
	var file = file_text_open_read(fname);
	var str = "";
	
	// Generate the text
	while (!file_text_eof(file)) {
		str += file_text_read_string(file);
		file_text_readln(file);
	}
	
	// Change the localization map
	var decoded = json_parse(str);
	return decoded;
}

/// Gets a string value from a JSON file
function json_raw(name, json) {
	var value = variable_struct_get(json, name);
	return value;
}

/// Gets a real value from a JSON file
function json_int(name, json) {
	var value = real(variable_struct_get(json, name));
	return value;
}

/// Gets an array value from a JSON file
function json_array(name, json) {
	var decoded = json_raw(name, json);
	var generated = [];
	
	for (var i = 0; i < array_length(decoded); i++)
		generated[i] = decoded[i];
	return generated;
}

