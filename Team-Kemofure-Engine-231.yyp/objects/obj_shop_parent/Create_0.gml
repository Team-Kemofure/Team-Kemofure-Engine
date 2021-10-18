/// @description Initialize

beginFade = fade_screen(c_black, 1, 0, 0.25, true);
alarm[0] = room_speed / 2;

state = 0;
subState = 0;
selection = 0;
prevSelection = 0;

strings = {
	sellingQuestion : "Are you sure that you want to sell this item?",
	buyList :	["item.consumables.monstercandy", 
				"item.consumables.monstercandy",
				"item.consumables.monstercandy"],
	stockList : [1, 3, 3]
}

// Scenes
scenes = {
	mainTextScene : -1,
	sellingScene : -1,
	defaultTalkingScene : -1,
	exitingScene : -1
}

// On Return
returning = {
	returnRoom : -1,
	returnTargetEntrance : -1,
	returnTargetDirection : dir_down
}

// Menu Options
options = {
	itemOptions : ds_list_create(),
	talkOptions : ds_list_create(),
	canSell : true
}

// Writer Settings
writer = {
	writer : noone,
	sound : [snd_voice_default],
	textSpeed : 0,
	textType : 0,
	font : fnt_main,
	instantPause : false,
	charWidth : 8,
	charHeight : 18
}


// Misc Variables
misc = {
	disableDrawing : false,
	smallBoxY : 0,
	mainTextX : 20,
	mainTextY : 138
}