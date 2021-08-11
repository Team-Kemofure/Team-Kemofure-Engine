/// @description Initialization

// Global variables for statistics regarding about the player
global.playername = "Chara";					// Our name
global.playerhp = 20;							// Our current HP
global.playermaxhp = 20;						// Our maximum capacity of HP
global.playerlv = 1;							// Our LV gained with EXP

// Global variables for other things
global.canmove = true;							// Are we able to move?
global.playersteps = 0;							// The current player steps
global.currentmusic = -1;						// The current music
global.enable_fading_scene = false;				// Should we enable the fading scene?
global.entrance_on_room_start = -1;				// The entrance we're going to spawn on at the start of the room
global.direction_on_room_start = dir_down;		// The direction that we're going to face to at the start of the room

// Other stuff
event_user(0);									// For macros and enums
display_set_gui_size(640, 480);					// Adjust the display GUI size
surface_resize(application_surface, 640, 480);	// Resize the application surface
room_goto_next();								// Proceed to the next room