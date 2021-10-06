/// Stops the current music
function music_stop() {
	audio_destroy_stream(global.currentmusic);
	global.currentmusic = -1;
}
