/// @description Write

if (state == 1) {
	var yoff;
	yoff = (player_isontop() ? 310 : 0);
	
	draw_menu_rectangle(32, 10 + yoff, 610, 162 + yoff, 6);
	
	switch (textType) {
		case 1:
			draw_text_style((portraitSprite != -1 ? 176 : 60), 30 + yoff, writer.internalStr, c_white, fnt_sans, 16, 36, 0, 2);
			break;
		case 2:
			draw_text_style((portraitSprite != -1 ? 176 : 60), 30 + yoff, writer.internalStr, c_white, fnt_papyrus, 24, 36, 0, 2);
			break;
		default:
			draw_text_style((portraitSprite != -1 ? 176 : 60), 30 + yoff, writer.internalStr, c_white, fnt_main, 16, 36);
			break;
	}
	
	if (portraitSprite != -1)
		draw_sprite_ext(portraitSprite, portraitIndex, 100, 85 + yoff, 2, 2, 0, c_white, 1);
}