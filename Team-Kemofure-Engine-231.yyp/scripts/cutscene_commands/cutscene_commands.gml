/// Ends the current cutscene action
function cutscene_end_action() {
	with (obj_cutscenehandler) {
		if (sceneInfo != -1) {
			if (scene < array_length(sceneInfo) - 1)
				scene++;
			else {
				scene = 0;
				sceneInfo = -1;
			}
		}
	}
}

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

function cutscene_move_character(targetX, targetY, imageSpeed) {
	
}

/// Creates a dialogue box with the given arguments
function cutscene_text_settings(sound, textType) {
	with (obj_overworldui) {	
		var finalized = [];
		for (var i = 0; i < array_length(sound); i++) {
			finalized[i] = asset_get_index(sound[i]);
		}

		self.sound = finalized;
		if (!is_undefined(textType))
			self.textType = real(textType);
	}
	cutscene_end_action();
}

/// Creates a dialogue box with the given arguments
function cutscene_run_text(msg, portrait) {
	with (obj_overworldui) {
		if (state == 0) && ((writer == -1) || (!instance_exists(writer))) {
			internalStr = lang_raw(msg, global.localization);
			
			// Initialize the writer
			writer = instance_create_depth(0, 0, 0, obj_writer);
			writer.voice = [snd_voice_default];
			writer.msg = internalStr;
			writer.draw = false;
			
			// Check if optional arguments are given
			if (!is_undefined(portrait))
				portraitSprite = asset_get_index(portrait);
			
			state = 1;
			if (!global.scene)
				global.canmove = false;
		}
	}
}

