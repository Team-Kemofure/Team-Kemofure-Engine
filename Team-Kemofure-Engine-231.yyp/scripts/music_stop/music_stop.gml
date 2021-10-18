/// Stops the current music
function music_stop() {
	audio_destroy_stream(global.currentmusicstream);
	global.currentmusicstream = -1;
}
