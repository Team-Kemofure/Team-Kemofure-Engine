/// @description Draw the text

if (enableDrawing) {
	draw_set_font(fnt_crypt);
	draw_set_halign(fa_center);
	draw_set_color(c_gray);
	draw_text(320, 360, "[PRESS Z OR ENTER]");
}

// Reset the alignment
draw_set_halign(fa_left);