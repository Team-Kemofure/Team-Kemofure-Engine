/// @description On Trigger

if (!global.scene) && (sceneArray != -1) {
	cutscene_create(sceneArray);
	global.canmove = false;
}
global.currentinteraction = currInteraction;
instance_destroy();