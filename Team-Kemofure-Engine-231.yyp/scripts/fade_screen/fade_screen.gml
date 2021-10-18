/// @param color
/// @param start
/// @param target
/// @param duration
/// @param fadeMusic
/// Changes the value of the fader
function fade_screen() {
	var fader = instance_create_depth(0, 0, 0, obj_gamefader);

	fader.color = argument[0];					// Assign the fader color
	fader.alpha = argument[1];					// Adjust the alpha
	fader.target = argument[2];					// Adjust the target alpha
	fader.duration = argument[3];				// Adjust the duration in seconds
	fader.fadeMusic = argument[4];				// Fade the music as well?
	
	if (fader.fadeMusic)
		music_set_volume(-fader.target + 1, fader.duration);
	return fader;
}
