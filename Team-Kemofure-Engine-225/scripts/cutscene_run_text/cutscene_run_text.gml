/// @param message
/// @param sound
/// @param font
/// Creates a dialogue box with the given arguments

with (obj_overworldui) {
	if (state == 0) && ((writer == -1) || (!instance_exists(writer))) {
		state = 1;
	
		message = argument[0];
		sound = [snd_voice_default];
		font = fnt_main;
	
		// Check if optional arguments are given
		if (argument_count > 1) {
			sound = argument[1];
			if (argument_count > 2)
				font = argument[2];
		}
	
		writer = instance_create_depth(0, 0, 0, obj_writer);
		writer.message = message;
		writer.sound = sound;
		writer.font = font;
		writer.draw = false;
	
		if (!global.scene)
			global.canmove = false;
	}
}