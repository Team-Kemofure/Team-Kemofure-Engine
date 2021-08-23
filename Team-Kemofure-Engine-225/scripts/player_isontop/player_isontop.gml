/// Checks if the player is on top of half of the screen

if (instance_exists(obj_char_player))
	return (obj_char_player.y < camera_get_view_y(0) + (camera_get_view_height(0) / 4));