/// @description Initialization

// Global variables for statistics regarding about the player
global.playername = "Chara";					// Our name
global.playerhp = 20;							// Our current HP
global.playermaxhp = 20;						// Our maximum capacity of HP
global.playerlv = 1;							// Our LV gained with EXP
global.playergold = 0;							// Our gold
global.playerxp = 0;							// Our EXP
global.playernext = 10;							// Our target EXP for the next level

global.playerat = 10;							// Our strength of attacking
global.playerwepat = 0;							// Our weapon's strength of attacking

global.playerdf = 10;							// Oursstrength of defending
global.playerarmdf = 0;							// Our armor's strength of defending

// Global variables for other things
global.scene = false;							// Are we currently in a scene?
global.canmove = true;							// Are we able to move?
global.playersteps = 0;							// The current player steps
global.currentmusic = -1;						// The current music
global.enable_fading_scene = false;				// Should we enable the fading scene?
global.entrance_on_room_start = -1;				// The entrance we're going to spawn on at the start of the room
global.direction_on_room_start = dir_down;		// The direction that we're going to face to at the start of the room
global.localization = lang_load("game");		// Initialize the localization
global.textformat = [];							// Text formatting
global.auto_skip_upon_dialogue_end = false;		// Should the dialogue auto-skip upon end?

// Other stuff
event_user(0);									// For macros and enums
display_set_gui_size(640, 480);					// Adjust the display GUI size
surface_resize(application_surface, 640, 480);	// Resize the application surface
room_goto_next();								// Proceed to the next room

// Create the necessary instances
instance_create_depth(0, 0, 0, obj_cutscenehandler);
instance_create_depth(0, 0, 0, obj_overworldmenu);
instance_create_depth(0, 0, 0, obj_overworldui);
call_list_add("Call Papyrus", "owmenu.contacts.papyrus.0");
call_list_add("Call Toriel", "owmenu.contacts.toriel.0");