/// @description Functionality

if (!completed) {
	if (target > 0)
		alpha += target / (duration * room_speed);
	else
		alpha -= (target + 1) / (duration * room_speed);
	
	if (alpha == target) || ((alpha - target) * (target > 0 ? 1 : -1) >= (target + (target > 0 ? 0 : 1)) / (duration * room_speed)) {
		alpha = target;
		if (fadeMusic)
			audio_sound_gain(global.currentmusic, (target - alpha > 0 ? 0 : maxMusicVolume), 0);
		event_user(0); // We've completed transitioning!
	}
	else if (fadeMusic)
		audio_sound_gain(global.currentmusic, clamp(1 - alpha, 0, maxMusicVolume), (duration / room_speed) * 1000);
}