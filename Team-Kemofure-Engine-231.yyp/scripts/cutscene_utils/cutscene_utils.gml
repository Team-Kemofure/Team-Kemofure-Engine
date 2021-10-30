function cutscene_create(info) {
	with (obj_cutscenehandler)
		sceneInfo = info;

	return info;
}


/// Ends the current cutscene action
function cutscene_end_action() {
	with (obj_cutscenehandler) {
		if (sceneInfo != -1) {
			if (scene < array_length(sceneInfo) - 1)
				scene++;
			else {
				scene = 0;
				global.canmove = true;
				sceneInfo = -1;
			}
		}
	}
}

/// Waits for a given amount of seconds
function cutscene_wait(seconds) {
	with (obj_cutscenehandler) {
		timer++;
		if (timer >= floor(real(seconds) * room_speed)) {
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
function cutscene_fade_screen(color, start, target, duration, fadeMusic) {
	fade_screen(color, start, target, duration, fadeMusic);
	cutscene_end_action();
}

/// Plays a sound effect and proceeds to the next scene
function cutscene_play_sfx(soundid) {
	var value = is_string(soundid);
	var sound = sfx_play(!value ? soundid : asset_get_index(soundid));
	cutscene_end_action();
	return sound;
}

function cutscene_move_character(object, targetX, targetY, relative, movementSpeed) {
	with (obj_cutscenehandler) {
		if (x_dest == -1) && (y_dest == -1) {
			x_dest = (!relative ? targetX : object.x + targetX);
			y_dest = (!relative ? targetY : object.y + targetY);
		}
		var xx = x_dest, yy = y_dest;
	}
	
	with (object) {
		// Check if distance is more than the speed
		if (point_distance(x, y, xx, yy) >= movementSpeed) {
			var dir = point_direction(x, y, xx, yy),
				ldirx = lengthdir_x(movementSpeed, dir),
				ldiry = lengthdir_y(movementSpeed, dir);
		
			x += ldirx;
			y += ldiry;
			direction = dir;
			currDir = direction_to_dir(id);
		}
		else {
			x = xx;
			y = yy;
			
			// Reset the values
			with (obj_cutscenehandler) {
				x_dest = -1;
				y_dest = -1;
			}
			cutscene_end_action();
		}
	}
}

/// Sets various settings for the upcoming dialogue(s)
function cutscene_text_settings(sound, textType) {
	with (obj_overworldui) {
		var finalized = [], value = false;
		for (var i = 0; i < array_length(sound); i++) {
			finalized[i] = asset_get_index(sound[i]);
			value = is_string(sound[i]);
		}
		
		self.sound = !value ? sound : finalized;
		if (!is_undefined(textType))
			self.textType = !value ? textType : real(textType);
	}
	cutscene_end_action();
}

/// Creates a dialogue box with the given arguments
function cutscene_run_text(msg, portrait) {
	with (obj_overworldui) {
		var value = variable_struct_exists(global.localization, msg);
		if (state == 0) && ((writer == -1) || (!instance_exists(writer))) {
			internalStr = format_text_basic(!value ? msg : json_raw(msg, global.localization));
			
			// Initialize the writer
			writer = instance_create_depth(0, 0, 0, obj_writer);
			writer.voice = [snd_voice_default];
			writer.msg = internalStr;
			writer.draw = false;
			
			// Check if optional arguments are given
			if (!is_undefined(portrait))
				portraitSprite = !value ? portrait : asset_get_index(portrait);
			
			state = 1;
			if (!global.scene)
				global.canmove = false;
		}
	}
}

function cutscene_set_music_volume(volume, seconds) {
	music_set_volume(volume, seconds);
	cutscene_end_action();
}

function cutscene_set_music_pitch(pitch) {
	music_set_pitch(pitch);
	cutscene_end_action();
}

// This script creates an animation on an instance relatively to the variable's value (Used during cutscenes)
function cutscene_create_instance_animation(instance, variable, targetValue, curveSubName, seconds) {
	create_instance_animation(instance, variable, targetValue, curveSubName, seconds);
	cutscene_end_action(); // End the order
}

function setMainShopText(internalStr) {
	with (obj_shop_parent) {
		writer.writer = instance_create_depth(0, 0, 0, obj_writer);
		writer.writer.voice = writer.sound;
		writer.writer.msg = format_text_basic(internalStr);
		writer.writer.draw = false;
	}
	cutscene_end_action();
}