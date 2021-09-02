/// @description Functionality

if (delay > 0)
	delay--;

if (state == 1) {
	showBox = true; // Show the dialogue box
	writer.voice = sound;
	if (!writer.completed) {
		if (key_shift_press) {
			writer.skip = true;
		}
		
		if (alarm[0] < 0)
			alarm[0] = portraitSpeed;
	}
	else {
		portraitIndex = 0;
		if (key_enter_press) || (global.auto_skip_upon_dialogue_end) {
			instance_destroy(writer);
			cutscene_end_action();
			portraitSprite = -1;
			delay = 3;
			state = 0;
			
			alarm[1] = 2;
			if (!global.scene) && (!obj_overworldmenu.active)
				global.canmove = true;
		}
	}
}