/// @description Additional Functionalities

if (instance_exists(col) || col != -1) {
	col.x = x - (sprite_width / 2);
	col.y = y + (sprite_height / 2);
}

depth = (-y + (sprite_height / 2)) * 100;