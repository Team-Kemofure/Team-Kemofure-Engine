/// @description Additional Functionalities

event_inherited();

var ui = obj_overworldui;
if (ui.state == 1) {
	if ((global.currentinteraction == id) && (!ui.writer.completed))
		image_speed = 0.4;
	else {
		image_speed = 0;
		image_index = 0;
	}
}
else if (ui.state == 0) {
	image_speed = 0;
	image_index = 0;
}


// Update our current sprite according from the current direction
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