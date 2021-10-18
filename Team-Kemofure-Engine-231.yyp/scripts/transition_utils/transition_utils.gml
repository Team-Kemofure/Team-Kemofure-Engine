/// Changes the value of the fader
function fade_screen(color, start, target, duration, fadeMusic) {
	var fader = instance_create_depth(0, 0, 0, obj_gamefader);

	fader.color = color;			// Assign the fader color
	fader.alpha = start;			// Adjust the alpha
	fader.target = target;			// Adjust the target alpha
	fader.duration = duration;		// Adjust the duration in seconds
	fader.fadeMusic = fadeMusic;	// Fade the music as well?
	
	if (fader.fadeMusic)
		music_set_volume(-fader.target + 1, fader.duration);
	return fader;
}
