/// Loads a music file from the included files
function music_load(file) {
	var fname = "data/mus/" + file + ".ogg";
	global.currentmusicstream = audio_create_stream(fname);
}

/// Plays a music file from the included files
function music_play(volume, pitch, loops) {
	global.currentmusic = audio_play_sound(global.currentmusicstream, 10, loops);
	audio_sound_gain(global.currentmusicstream, volume, 0);
	audio_sound_pitch(global.currentmusicstream, pitch);
}

/// Stops the current music
function music_stop() {
	audio_destroy_stream(global.currentmusicstream);
	global.currentmusicstream = -1;
	global.currentmusic = -1;
}

/// Sets the music volume
function music_set_volume(volume, seconds) {
	audio_sound_gain(global.currentmusic, volume, seconds * 1000);
}

/// Sets the music pitch
function music_set_pitch(pitch) {
	audio_sound_pitch(global.currentmusic, pitch);
}

/// Plays a sound effect
function sfx_play(soundid) {
	audio_play_sound(soundid, 8, false);
}