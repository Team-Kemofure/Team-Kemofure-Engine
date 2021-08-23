/// @description Functionality

if (state == 1) {
	if (!writer.completed) {
		if (key_shift_press) {
			writer.skip = true;
		}
	}
	else {
		if (key_enter_press) || (global.auto_skip_upon_dialogue_end) {
			instance_destroy(writer);
			cutscene_end_action();
			state = 0;
			
			if (!global.scene)
				global.canmove = true;
		}
	}
}