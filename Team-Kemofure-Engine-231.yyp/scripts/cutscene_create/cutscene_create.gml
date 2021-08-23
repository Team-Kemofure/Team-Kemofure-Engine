/// @param sceneInfo
/// Initializes the scene info and runs the cutscene
function cutscene_create() {
	with (obj_cutscenehandler)
		sceneInfo = argument[0];

	return argument[0];
}
