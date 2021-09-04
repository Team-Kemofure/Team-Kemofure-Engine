/// @description Functionality

var menu = obj_overworldmenu;
if (key_ctrl_press && menu.mainState == 0 && !global.enable_fading_scene) {
	menu.active = !menu.active;
	global.canmove = !global.canmove;
	audio_play_sound(snd_menumove, 10, false);
}

// Are we able to move?
if (global.canmove) {
	var u = key_up, d = key_down, l = key_left, r = key_right;				// Adjust the keys
	var collisionLeft = place_meeting(x - moveSpeed, y, obj_solid_parent),
		collisionRight = place_meeting(x + moveSpeed, y, obj_solid_parent),
		collisionUp = place_meeting(x, y - moveSpeed, obj_solid_parent),
		collisionDown = place_meeting(x, y + moveSpeed, obj_solid_parent);	// Adjust the collisions
	var specialKey = (u && d);												// The two special keys to dance
	var readyToDance = (specialKey && collisionUp);							// Are we colliding and holding the special keys?
	
	// Player movement functionality
	if (l && r)
		r = false;
	if (specialKey && !readyToDance)
		d = false;
	
	// Left key
	if (l) {
		if (!collisionLeft)
			x -= moveSpeed;
		else {
			if (u) currDir = dir_up;
			if (d) currDir = dir_down;
		}
		
		if (!specialKey && !(u && currDir == dir_up) && !(d && currDir == dir_down))
			currDir = dir_left;
	}
	
	// Right key
	if (r) {
		if (!collisionRight)
			x += moveSpeed;
		else {
			if (u) currDir = dir_up;
			if (d) currDir = dir_down;
		}
		
		if (!specialKey && !(u && currDir == dir_up) && !(d && currDir == dir_down))
			currDir = dir_right;
	}
	
	// Up key
	if (u) {
		if (!collisionUp && !readyToDance)
			y -= moveSpeed;
		else {
			if (l) currDir = dir_left;
			if (r) currDir = dir_right;
		}
		
		if (readyToDance || !(l && currDir == dir_left) && !(r && currDir == dir_right))
			currDir = dir_up;
	}
	
	// Down key
	if (d) {
		if (!collisionDown)
			y += moveSpeed;
		else {
			if (l) currDir = dir_left;
			if (r) currDir = dir_right;
		}
		
		if (!(l && currDir == dir_left) && !(r && currDir == dir_right))
			currDir = dir_down;
	}
	
	// Bottom-left slope
	if (l && place_meeting(x + moveSpeed, y, obj_slope_BL))
		y -= moveSpeed;
	if (d && place_meeting(x, y - moveSpeed, obj_slope_BL))
		x += moveSpeed;
	
	// Bottom-right slope
	if (r && place_meeting(x - moveSpeed, y, obj_slope_BR))
		y -= moveSpeed;
	if (d && place_meeting(x, y - moveSpeed, obj_slope_BR))
		x -= moveSpeed;
	
	// Top-left slope
	if (l && place_meeting(x + moveSpeed, y, obj_slope_TL))
		y += moveSpeed;
	if (u && place_meeting(x, y + moveSpeed, obj_slope_TL))
		x += moveSpeed;
	
	// Top-right slope
	if (r && place_meeting(x - moveSpeed, y, obj_slope_TR))
		y += moveSpeed;
	if (u && place_meeting(x, y + moveSpeed, obj_slope_TR))
		x -= moveSpeed;
}

// Door collision check!
if (place_meeting(x, y, obj_door) && global.canmove && !global.enable_fading_scene) {
	var inst = instance_place(x, y, obj_door);
	fader = fader_changeval(c_black, 0, 1, 0.25, false);
	targetRoom = inst.targetRoom;
	
	global.entrance_on_room_start = inst.targetEntrance;
	global.direction_on_room_start = inst.targetDirection;
	global.enable_fading_scene = true;
	
	global.canmove = false;
}

if (global.enable_fading_scene) {
	if (fader.completed)
		room_goto(targetRoom);
}

// Player movement check!
if (xprevious != x || yprevious != y) {
	if (image_speed == 0)	// Is the image speed 0?
		image_index = 1;	// Start moving with the image index being 1
	image_speed = 0.4;		// Adjust our visual speed
	xprevious = x;			// Set our previous X position to the current
	yprevious = y;			// Set our previous Y position to the current
}
else {
	image_index = 0;		// Reset the image index
	image_speed = 0;		// Reset the image speed
}

// Update our current sprite according from the current direction
switch (currDir) {
	case dir_down:
		sprite_index = spr_player_down;
		break;
	case dir_up:
		sprite_index = spr_player_up;
		break;
	case dir_left:
		sprite_index = spr_player_left;
		break;
	case dir_right:
		sprite_index = spr_player_right;
		break;
}