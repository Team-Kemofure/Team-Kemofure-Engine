/// @description Functionality

var lenCheckMulti = (target > 0 ? 1 : -1), lenCheckAdd = (target > 0 ? 0 : -1),
	lenCheck = lengthdir_x((alpha - target) * lenCheckMulti, 0);
if (!completed) {
	if (target > 0)
		alpha += target / (duration * room_speed);
	else
		alpha -= (target + 1) / (duration * room_speed);
	
	//if (alpha == target) || ((alpha - target) * (target > 0 ? 1 : -1) >= (target + (target > 0 ? 0 : 1)) / (duration * room_speed)) {
	if (alpha == target) || (lenCheck >= (target + lenCheckAdd) / (duration * room_speed)) {
		alpha = target;
		if (fadeMusic)
			audio_sound_gain(global.currentmusicstream, !target, 0);
		event_user(0); // We've completed transitioning!
	}
}