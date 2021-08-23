/// @description Reset our current steps

global.playersteps = 0;

if (global.enable_fading_scene) {
	fader = fader_changeval(c_black, 1, 0, 0.25, false);
	
	global.canmove = true;
	global.enable_fading_scene = false;
	x = global.entrance_on_room_start.x;
	y = global.entrance_on_room_start.y;
	currDir = global.direction_on_room_start;
}