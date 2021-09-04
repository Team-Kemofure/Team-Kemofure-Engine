/// @description Initialization

event_user(0);											// For macros and enums

global.playerstats = {
	name : "Chara",
	hp : [20, 20],
	level : 1,
	
	experience : 0,
	next : 10,
	gold : 0,
	
	weapon : WEAPON.STICK,
	armor : ARMOR.BANDAGE,
	
	attack : 10,
	weapon_attack : 0,
	
	defense : 10,
	armor_defense : 0,
	
	inventory : ds_list_create()
}

// Global variables for other things
global.scene = false;									// Are we currently in a scene?
global.canmove = true;									// Are we able to move?
global.playersteps = 0;									// The current player steps
global.currentmusic = -1;								// The current music
global.currentinteraction = noone;						// The NPC we're currently interacting
global.enable_fading_scene = false;						// Should we enable the fading scene?
global.entrance_on_room_start = -1;						// The entrance we're going to spawn on at the start of the room
global.direction_on_room_start = dir_down;				// The direction that we're going to face to at the start of the room
global.localization = json_load("game");				// Initialize the localization
global.cutscenejson = json_load("cutscenes");			// Initialize the cutscene JSON
global.textformat = [];									// Text formatting
global.auto_skip_upon_dialogue_end = false;				// Should the dialogue auto-skip upon end?

// Other stuff
display_set_gui_size(640, 480);							// Adjust the display GUI size
surface_resize(application_surface, 640, 480);			// Resize the application surface
room_goto_next();										// Proceed to the next room

// Create the necessary instances
instance_create_depth(0, 0, 0, obj_cutscenehandler);
instance_create_depth(0, 0, 0, obj_overworldmenu);
instance_create_depth(0, 0, 0, obj_overworldui);
call_list_add("Call Papyrus", "owmenu.contacts.papyrus.0");
item_add("item.consumables.monstercandy");