/// @description Initialization

state = 0;						// Current state
writer = -1;					// The current writer

message = "";					// The message to write on the screen
sound = [snd_voice_default];	// The sound to play while writing
font = fnt_main;				// The font of the message
type = 0;						// Text type

portraitSprite = -1;	// Portrait sprite
portraitSpeed = 0.2;	// Portrait image speed