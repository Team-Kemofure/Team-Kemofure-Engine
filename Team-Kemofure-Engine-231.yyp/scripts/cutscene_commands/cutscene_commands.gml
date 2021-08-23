/// Waits for a given amount of seconds
function cutscene_wait(seconds) {
	with (obj_cutscenehandler) {
		timer++;
		if (timer >= real(seconds) * room_speed) {
			cutscene_end_action();
			timer = 0;
		}
	}
}

/// Ends the current cutscene action
function cutscene_end_action() {
	with (obj_cutscenehandler) {
		if (sceneInfo != -1) {
			if (scene < array_length(sceneInfo[scene]) - 1)
				scene++;
			else {
				scene = 0;
				sceneInfo = -1;
			}
		}
	}
}

/// Creates an instance and proceeds to the next scene
function cutscene_create_instance(_x, _y, _depth, obj) {
	var inst = instance_create_depth(_x, _y, _depth, obj);
	cutscene_end_action();
	return inst;
}

/// Destroys an instance and proceeds to the next scene
function cutscene_destroy_instance(obj) {
	instance_destroy(obj);
	cutscene_end_action();
}

/// Fades the screen to a value and proceeds to the next scene
function cutscene_fade_screen(color, startingAlpha, targetAlpha, duration, fadeMusic) {
	fader_changeval(color, startingAlpha, targetAlpha, duration, fadeMusic);
	cutscene_end_action();
}

/// Plays a sound effect and proceeds to the next scene
function cutscene_play_sfx(soundid) {
	var sound = sfx_play(asset_get_index(soundid));
	cutscene_end_action();
	return sound;
}

/// Creates a dialogue box with the given arguments
function cutscene_run_text(msg, sound, font) {
	with (obj_overworldui) {
		if (state == 0) && ((writer == -1) || (!instance_exists(writer))) {
			state = 1;
	
			internalStr = msg;
			self.sound = [snd_voice_default];
			self.font = fnt_main;
	
			// Check if optional arguments are given
			if (argument_count > 1) {
				sound = argument[1];
				if (argument_count > 2)
					font = argument[2];
			}
	
			writer = instance_create_depth(0, 0, 0, obj_writer);
			writer.msg = internalStr;
			writer.sound = sound;
			writer.font = font;
			writer.draw = false;
	
			if (!global.scene)
				global.canmove = false;
		}
	}
}

