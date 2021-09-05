/// Sets the solid four direction from the current real direction
function direction_to_dir(object) {
	if (object.direction >= 225 && object.direction < 315)
		return dir_down;
	if (object.direction >= 315 || object.direction < 45)
		return dir_right;
	if (object.direction >= 45 && object.direction < 135)
		return dir_up;
	if (object.direction >= 135 && object.direction < 225)
		return dir_left;
}

/// Checks if the player is on top of half of the screen
function player_isontop() {
	if (instance_exists(obj_char_player))
		return (obj_char_player.y < camera_get_view_y(0) + (camera_get_view_height(0) / 4))
}
