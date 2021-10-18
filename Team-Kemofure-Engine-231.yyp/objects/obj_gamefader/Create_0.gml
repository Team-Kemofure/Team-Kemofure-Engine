/// @description Initialize

event_inherited();

depth = -99000;			// Assign the depth
color = c_black;		// Current color of the fader
alpha = 0;				// Current alpha of the fader
target = 1;				// Target alpha of the fader
duration = 1;			// Duration of the fader
fadeMusic = false;		// Are we also going to fade the music?
maxMusicVolume = 1;		// Max volume of the music