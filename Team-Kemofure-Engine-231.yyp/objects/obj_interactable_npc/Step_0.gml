/// @description Additional Functionalities

event_inherited();
var ui = obj_overworldui;

function dirToStruct(str) {
	switch (currDir) {
		case dir_up: return str + "_up"; break;
		case dir_down: return str + "_down"; break;
		case dir_left: return str + "_left"; break;
		case dir_right: return str + "_right"; break;
	}
}

if (xprevious != x || yprevious != y) {
	if (image_speed == 0)
		image_index = 1;
	image_speed = 0.4;
}
else {
	if (ui.state == 1) {
		if ((global.currentinteraction == id) && (!ui.writer.completed)) {
			sprite_index = variable_struct_get(sprites, dirToStruct("talk"));
			image_speed = 0.4;
		}
		else {
			image_speed = 0;
			image_index = 0;
		}
	}
	else if (ui.state == 0) {
		image_speed = 0;
		image_index = 0;
	}
}

// Update our current sprite according from the current direction
if (ui.state == 0 || global.currentinteraction != id) {
	switch (currDir) {
		case dir_down:
			sprite_index = sprites.down;
			break;
		case dir_up:
			sprite_index = sprites.up;
			break;
		case dir_left:
			sprite_index = sprites.left;
			break;
		case dir_right:
			sprite_index = sprites.right;
			break;
	}
}