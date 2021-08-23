/// @description Draw

// Exit if the menu is not active
if (!active)
	exit;

// Initialize the local variables
var yoff;
yoff = (player_isontop() ? 0 : 271);

// Draw the rectangles
draw_menu_rectangle(32, yoff + 52, 173, yoff + 161, 6);
draw_menu_rectangle(32, 168, 173, 315, 6);

draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_font(fnt_main);
draw_text(46, yoff + 61, global.playername);
draw_set_font(fnt_crypt);

// LV
draw_text(46, yoff + 99, lang_raw("owmenu.love", global.localization));
draw_text(82, yoff + 99, string(global.playerlv));

// HP
draw_text(46, yoff + 117, lang_raw("owmenu.hp", global.localization));
draw_text(82, yoff + 117, format_text_basic(string(global.playerhp) + "/" + string(global.playermaxhp), false, false));

// GOLD
draw_text(46, yoff + 135, lang_raw("owmenu.gold", global.localization));
draw_text(82, yoff + 135, string(global.playergold));

draw_set_font(fnt_main);
if (!itemEnabled)
	draw_set_color(c_gray);
draw_text(84, 189, lang_raw("owmenu.item", global.localization));
draw_set_color(c_white);
draw_text(84, 225, lang_raw("owmenu.stat", global.localization));
if (cellEnabled)
	draw_text(84, 261, lang_raw("owmenu.cell", global.localization));

switch (mainState) {
	case 0:
		// Draw the heart for indicating the selection
		draw_sprite_ext(spr_heartsmall, 0, 56, 196 + (36 * selection), 2, 2, 0, c_white, 1);
		break;
	case 2:
		draw_menu_rectangle(188, 52, 533, 469, 6); // Initialize the box
		draw_set_color(c_white);
		draw_text(216, 85, format_text_basic("\"" + global.playername + "\"", false, false));
		draw_text(216, 145, format_text_basic(lang_raw("owmenu.love", global.localization) + "  " + string(global.playerlv), false, false));
		draw_text(216, 177, format_text_basic(lang_raw("owmenu.hp", global.localization) + "  " + string(global.playerhp) + " / " + string(global.playermaxhp), false, false));
		
		draw_text(216, 241, format_text_basic(lang_raw("owmenu.at", global.localization) + "  " + string(global.playerat - 10) + " (" + string(ceil(global.playerwepat)) + ")", false, false));
		draw_text(384, 241, format_text_basic(lang_raw("owmenu.exp", global.localization) + ": " + string(global.playerxp), false, false));
		
		draw_text(216, 273, format_text_basic(lang_raw("owmenu.df", global.localization) + "  " + string(global.playerdf - 10) + " (" + string(ceil(global.playerarmdf)) + ")", false, false));
		draw_text(384, 273, format_text_basic(lang_raw("owmenu.next", global.localization) + ": " + string(global.playernext), false, false));
		
		draw_text(216, 333, format_text_basic(lang_raw("owmenu.weapon", global.localization) + ": " + "UNDEFINED", false, false));
		draw_text(216, 365, format_text_basic(lang_raw("owmenu.armor", global.localization) + ": " + "UNDEFINED", false, false));
		draw_text(216, 405, format_text_basic(lang_raw("owmenu.gold_alt", global.localization) + ": " + string(global.playergold), false, false));
		break;
	case 3:
		if (subState == 0) {
			draw_menu_rectangle(188, 52, 533, 321, 6); // Initialize the box
			draw_sprite_ext(spr_heartsmall, 0, 208, 88 + (32 * selection), 2, 2, 0, c_white, 1); // Draw the heart for indicating the selection
		
			draw_set_color(c_white);
			for (var i = 0; i < ds_list_size(contactList); i++)
				draw_text(232, 80 + (32 * i), ds_list_find_value(contactNameList, i));
		}
		break;
}