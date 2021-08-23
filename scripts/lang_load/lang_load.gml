/// @param fname
/// Loads a JSON file and loads that language into the game

var fname = "data/" + argument[0] + ".json";
var file = file_text_open_read(fname);
var str = "";

// Generate the text
while (!file_text_eof(file)) {
	str += file_text_read_string(file);
	file_text_readln(file);
}

// Change the localization map
var decoded = json_decode(str);
global.localization = ds_map_find_value(decoded, "default");