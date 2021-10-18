/// @param volume
/// @param pitch
/// @param loop
/// Plays a music file from the included files
function music_play() {
	global.currentmusic = audio_play_sound(global.currentmusicstream, 10, argument[2]);
	audio_sound_gain(global.currentmusicstream, argument[0], 0);
	audio_sound_pitch(global.currentmusicstream, argument[1]);
}
