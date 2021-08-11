/// @description Initialization

message = "* Error!";	// The message we're going to write
internalStr = "";		// Already written message
internalPos = 0;		// Written message length

textSpeed = 1;					// Text speed
font = fnt_main;				// The current font
color = c_white;				// The current text color
voice = [snd_voice_default];	// The current voice
effect = 0;						// The current effect

charWidth = 16;		// The current character width
charHeight = 36;	// The current character height

pauseTimer = 1;		// Text writing delay
completed = false;	// Are we done writing? 
draw = true;		// Should we display the text?