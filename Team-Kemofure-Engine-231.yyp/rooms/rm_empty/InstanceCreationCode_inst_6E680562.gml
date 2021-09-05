sceneArray = [
	[cutscene_text_settings, [snd_voice_default], 0],
	[cutscene_run_text, "* Turn around me! * I want to see it!"],
	[cutscene_move_character, obj_char_player, 320, 100, false, 1],
	[cutscene_wait, 1],
	[cutscene_move_character, obj_char_player, -20, 0, true, 1],
	[cutscene_move_character, obj_char_player, 0, 35, true, 1],
	[cutscene_move_character, obj_char_player, 40, 0, true, 1],
	[cutscene_move_character, obj_char_player, 0, -35, true, 1],
	[cutscene_move_character, obj_char_player, -10, 0, true, 1],
	[cutscene_run_text, "* Thank you so much!"]
];