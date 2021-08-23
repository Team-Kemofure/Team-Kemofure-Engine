/// Ends the current cutscene action

with (obj_cutscenehandler) {
	if (sceneInfo != -1) {
		if (scene < array_length_1d(sceneInfo[scene]) - 1)
			scene++;
		else {
			scene = 0;
			sceneInfo = -1;
		}
	}
}