/// @param x
/// @param y
/// @param message
/// @arg color
/// @arg font
/// @arg charWidth
/// @arg charHeight
/// @description Writes out text with its own commands

var _x = argument[0];			// The X position of the text
var _y = argument[1];			// The Y position of the text
var beginX = _x;				// The initialized X position of the text

var msg = argument[2];			// The message to be written in
var color = c_white;			// The color the text is going to have
var font = fnt_main;			// The font the text is going to have
var charWidth = 8;				// The character width
var charHeight = 18;			// The character height
var effect = -1;				// The current text effect
var len = string_length(msg);	// The length the message has

if (argument_count > 3) {
	color = argument[3];
	if (argument_count > 4) {
		font = argument[4];
		if (argument_count > 5) {
			charWidth = argument[5];
			if (argument_count > 6) {
				charHeight = argument[6];
				if (argument_count > 7) {
					effect = argument[7];
				}
			}
		}
	}
}

draw_set_color(color);
draw_set_font(font);

for (var i = 1; i <= len; i++) {
	var char = string_char_at(msg, i);
	switch (char) {
		case "`":
			var cmdType = string_char_at(msg, ++i);
			switch (cmdType) {
				case "c": // Color
					var cmdOperand = string_char_at(msg, ++i);
					switch (cmdOperand) {
						case "W": color = c_white;   break;
						case "X": color = c_black;   break;
						case "R": color = c_red;     break;
						case "B": color = c_blue;    break;
						case "Y": color = c_yellow;  break;
						case "G": color = c_green;   break;
						case "M": color = c_fuchsia; break;
					}
					draw_set_color(color);
					break;
				case "e": // Effect
					effect = real(string_char_at(msg, ++i));
					break;
				default:
					i--;
					break;
			}
			break;
		case "#":
			_x = beginX;
			_y += charHeight;
			break;
		default:
			switch (effect) {
				case 0:
				default: // Default
					draw_text(_x, _y, char);
					break;
				case 1: // Shaky
					draw_text(_x + irandom(1), _y + irandom(1), char);
					break;
			}
			_x += charWidth;
			break;
	}
}