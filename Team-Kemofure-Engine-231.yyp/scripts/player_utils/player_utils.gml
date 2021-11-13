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

function savegame() {
	var buffer = buffer_create(1024, buffer_grow, 1), compressed;
	buffer_seek(buffer, buffer_seek_start, 0);
	
	buffer_write(buffer, buffer_string, global.playername);
	buffer_write(buffer, buffer_u16, global.playerhp);
	buffer_write(buffer, buffer_u16, global.playerhpmax);
	buffer_write(buffer, buffer_u8, global.playerlv);
	
	buffer_write(buffer, buffer_u16, global.playerexp);
	buffer_write(buffer, buffer_u16, global.playernext);
	buffer_write(buffer, buffer_u32, global.playergold);
	
	buffer_write(buffer, buffer_u8, global.playerwep);
	buffer_write(buffer, buffer_u8, global.playerarm);
	
	buffer_write(buffer, buffer_u16, global.playerat);
	buffer_write(buffer, buffer_u16, global.playerat_wep);
	buffer_write(buffer, buffer_u16, global.playerdf);
	buffer_write(buffer, buffer_u16, global.playerdf_arm);
	
	buffer_write(buffer, buffer_u8, global.playerinv);
	buffer_write(buffer, buffer_u32, global.currentroom);
	buffer_write(buffer, buffer_u8, global.time_seconds);
	buffer_write(buffer, buffer_u32, global.time_minutes);
	
	compressed = buffer_compress(buffer, 0, buffer_tell(buffer));
	buffer_save(compressed, "file0");
	
	buffer_delete(buffer);
	buffer_delete(compressed);
}

function loadgame() {
	var buffer = buffer_load("file0"), decompressed = buffer_decompress(buffer), array;
	
	array[0] = buffer_read(decompressed, buffer_string);
	array[1] = buffer_read(decompressed, buffer_u16);
	array[2] = buffer_read(decompressed, buffer_u16);
	array[3] = buffer_read(decompressed, buffer_u8);
	array[4] = buffer_read(decompressed, buffer_u16);
	array[5] = buffer_read(decompressed, buffer_u16);
	array[6] = buffer_read(decompressed, buffer_u32);
	array[7] = buffer_read(decompressed, buffer_u8);
	array[8] = buffer_read(decompressed, buffer_u8);
	array[9] = buffer_read(decompressed, buffer_u16);
	array[10] = buffer_read(decompressed, buffer_u16);
	array[11] = buffer_read(decompressed, buffer_u16);
	array[12] = buffer_read(decompressed, buffer_u16);
	array[13] = buffer_read(decompressed, buffer_u8);
	array[14] = buffer_read(decompressed, buffer_u32);
	array[15] = buffer_read(decompressed, buffer_u8);
	array[16] = buffer_read(decompressed, buffer_u32);
	
	return array;
	buffer_delete(buffer);
	buffer_delete(decompressed);
}