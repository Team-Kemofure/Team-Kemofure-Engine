/// @description Draw

var _x = camera_get_view_x(0);
var _y = camera_get_view_y(0);

draw_set_color(color);	// Set the color
draw_set_alpha(alpha);	// Set the alpha
draw_rectangle(_x, _y, _x + camera_get_view_width(0), _y + camera_get_view_height(0), false);	// Draw the rectangle

// Reset the values
draw_set_alpha(1);