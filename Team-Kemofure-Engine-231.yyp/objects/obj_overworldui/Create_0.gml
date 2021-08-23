/// @description Initialization

state = 0;		// Current state
delay = 2;		// Box visibility delay
writer = -1;	// The current writer

internalStr = "";				// The message to write on the 
textType = 0;					// Text type
sound = [snd_voice_default];	// Text sound

portraitSprite = -1;	// Portrait sprite
portraitSpeed = 5;		// Portrait image speed
portraitIndex = 0;		// Portrait image index