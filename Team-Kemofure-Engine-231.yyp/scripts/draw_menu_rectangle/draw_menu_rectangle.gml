/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param outlineSize
/// Draws a rectangle with a white border
function draw_menu_rectangle() {

	var x1 = argument[0], y1 = argument[1],
		x2 = argument[2], y2 = argument[3];	// Drawing coordinates
	var outlineSize = argument[4];			// Outline size

	draw_set_color(c_white);
	draw_rectangle(x1, y1, x2, y2, false);
	draw_set_color(c_black);
	draw_rectangle(x1 + outlineSize, y1 + outlineSize, x2 - outlineSize, y2 - outlineSize, false);


}
