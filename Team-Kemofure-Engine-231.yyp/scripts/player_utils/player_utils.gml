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
	
	array = {
		name : buffer_peek(decompressed, 1, buffer_string),
		hp : buffer_peek(decompressed, 2, buffer_u16), 
		hp_max : buffer_peek(decompressed, 3, buffer_u16),
		level : buffer_peek(decompressed, 4, buffer_u8),
		
		experience : buffer_peek(decompressed, 5, buffer_u16),
		next : buffer_peek(decompressed, 6, buffer_u16),
		gold : buffer_peek(decompressed, 7, buffer_u32),
		
		weapon : buffer_peek(decompressed, 8, buffer_u8),
		armor : buffer_peek(decompressed, 9, buffer_u8),
		
		attack : buffer_peek(decompressed, 10, buffer_u16),
		weapon_attack : buffer_peek(decompressed, 11, buffer_u16),
		
		defense : buffer_peek(decompressed, 12, buffer_u16),
		armor_defense : buffer_peek(decompressed, 13, buffer_u16),
		
		inventory : buffer_peek(decompressed, 14, buffer_u8),
		currentroom : buffer_peek(decompressed, 15, buffer_u32),
		time_seconds : buffer_peek(decompressed, 16, buffer_u8),
		time_minutes : buffer_peek(decompressed, 17, buffer_u32)
	};
	
	return array;
	buffer_delete(buffer);
	buffer_delete(decompressed);
}