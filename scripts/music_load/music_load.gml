/// @param fname
/// @description Loads a music file from the included files

var fname = "data/mus/" + argument[0] + ".ogg";
global.currentmusic = audio_create_stream(fname);