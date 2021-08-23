/// @param color
/// @param startingAlpha
/// @param targetAlpha
/// @param duration
/// @param fadeMusic
/// Changes the value of the fader

var fader = -1;
if (!instance_exists(fader) || fader == -1)
	fader = instance_create_depth(0, 0, 0, obj_gamefader);

fader.color = argument[0];					// Assign the fader color
fader.alpha = argument[1];					// Adjust the alpha
fader.target = argument[2];					// Adjust the target alpha
fader.duration = argument[3];				// Adjust the duration in seconds
fader.fadeMusic = argument[4];				// Fade the music as well?

return fader;