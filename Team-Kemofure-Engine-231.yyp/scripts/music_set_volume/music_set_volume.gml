function music_set_volume(volume, seconds) {
	audio_sound_gain(global.currentmusic, volume, seconds * 1000);
}