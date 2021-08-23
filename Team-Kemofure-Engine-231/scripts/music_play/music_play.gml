/// @param volume
/// @param pitch
/// @param loop
/// Plays a music file from the included files

if (global.currentmusic == -1)
	show_error("Error! Initialize the current music first.", true);
else {
	audio_play_sound(global.currentmusic, 10, argument[2]);
	audio_sound_gain(global.currentmusic, argument[0], 0);
	audio_sound_pitch(global.currentmusic, argument[1]);
}