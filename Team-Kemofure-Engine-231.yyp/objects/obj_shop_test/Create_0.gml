/// @description Initialize

event_inherited();

// Scenes
scenes = {
	mainTextScene : [[setMainShopText, "* Hello, traveler! * What can I do for you?"]],
	sellingScene : [[setMainShopText, "* Sorry, I don't accept any items."]],
	defaultTalkingScene : -1,
	exitingScene : [[setMainShopText, "* Have a good day!"]]
}

// On Return
returning = {
	returnRoom : rm_test,
	returnTargetEntrance : obj_entrance_eid_2,
	returnTargetDirection : dir_down
}

cutscene_create(scenes.mainTextScene);