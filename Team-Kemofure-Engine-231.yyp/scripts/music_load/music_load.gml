/// @param fname
/// Loads a music file from the included files
function music_load() {

	var fname = "data/mus/" + argument[0] + ".ogg";
	global.currentmusic = audio_create_stream(fname);


}
