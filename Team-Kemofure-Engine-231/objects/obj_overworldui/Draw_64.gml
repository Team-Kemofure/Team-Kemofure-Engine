/// @description Write

if (state == 1) && (message != "") {
	var yoff;
	yoff = (player_isontop() ? 310 : 0);
	
	draw_menu_rectangle(32, 10 + yoff, 610, 162 + yoff, 6);
	
	switch (type) {
		case 1:
			draw_text_style((portraitSprite != -1 ? 176 : 60), 30 + yoff, writer.internalStr, c_white, fnt_sans, 16, 36);
			break;
		default:
			draw_text_style((portraitSprite != -1 ? 176 : 60), 30 + yoff, writer.internalStr, c_white, fnt_main, 16, 36);
			break;
	}
}