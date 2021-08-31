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
draw_text(46, yoff + 61, global.playerstats.name);
draw_set_font(fnt_crypt);

// LV
draw_text(46, yoff + 99, json_raw("owmenu.love", global.localization));
draw_text(82, yoff + 99, string(global.playerstats.level));

// HP
draw_text(46, yoff + 117, json_raw("owmenu.hp", global.localization));
draw_text(82, yoff + 117, format_text_basic(string(global.playerstats.hp[0]) + "/" + string(global.playerstats.hp[1]), false, false));

// GOLD
draw_text(46, yoff + 135, json_raw("owmenu.gold", global.localization));
draw_text(82, yoff + 135, string(global.playerstats.gold));

draw_set_font(fnt_main);
if (!itemEnabled)
	draw_set_color(c_gray);
draw_text(84, 189, json_raw("owmenu.item", global.localization));
draw_set_color(c_white);
draw_text(84, 225, json_raw("owmenu.stat", global.localization));
if (cellEnabled)
	draw_text(84, 261, json_raw("owmenu.cell", global.localization));

switch (mainState) {
	case 0:
		// Draw the heart for indicating the selection
		draw_sprite_ext(spr_heartsmall, 0, 56, 196 + (36 * selection), 2, 2, 0, c_white, 1);
		break;
	case 1:
		if (subState != 2) {
			draw_menu_rectangle(188, 52, 533, 413, 6); // Initialize the box
			if (subState == 0)
				draw_sprite_ext(spr_heartsmall, 0, 208, 88 + (32 * selection), 2, 2, 0, c_white, 1); // Draw the heart for indicating the selection
			else if (subState == 1)
				draw_sprite_ext(spr_heartsmall, 0, 208 + (selection == 1 ? 96 : (selection == 2 ? 210 : 0)), 368, 2, 2, 0, c_white, 1); // Draw the heart for indicating the selection
			
			draw_set_color(c_white);
			for (var i = 0; i < ds_list_size(global.playerstats.inventory); i++)
				draw_text(232, 80 + (32 * i), item_get_name(ds_list_find_value(global.playerstats.inventory, i)));
			// Item actions
			draw_text(232, 360, json_array("item.actions", global.localization)[0]);
			draw_text(328, 360, json_array("item.actions", global.localization)[1]);
			draw_text(442, 360, json_array("item.actions", global.localization)[2]);
		}
		break;
	case 2:
		draw_menu_rectangle(188, 52, 533, 469, 6); // Initialize the box
		draw_set_color(c_white);
		draw_text(216, 85, format_text_basic("\"" + global.playerstats.name + "\"", false, false));
		draw_text(216, 145, format_text_basic(json_raw("owmenu.love", global.localization) + "  " + string(global.playerstats.level), false, false));
		draw_text(216, 177, format_text_basic(json_raw("owmenu.hp", global.localization) + "  " + string(global.playerstats.hp[0]) + " / " + string(global.playerstats.hp[1]), false, false));
		
		draw_text(216, 241, format_text_basic(json_raw("owmenu.at", global.localization) + "  " + string(global.playerstats.attack - 10) + " (" + string(ceil(global.playerstats.weapon_attack)) + ")", false, false));
		draw_text(384, 241, format_text_basic(json_raw("owmenu.exp", global.localization) + ": " + string(global.playerstats.experience), false, false));
		
		draw_text(216, 273, format_text_basic(json_raw("owmenu.df", global.localization) + "  " + string(global.playerstats.defense - 10) + " (" + string(ceil(global.playerstats.armor_defense)) + ")", false, false));
		draw_text(384, 273, format_text_basic(json_raw("owmenu.next", global.localization) + ": " + string(global.playerstats.next), false, false));
		
		draw_text(216, 333, format_text_basic(json_raw("owmenu.weapon", global.localization) + ": " + "UNDEFINED", false, false));
		draw_text(216, 365, format_text_basic(json_raw("owmenu.armor", global.localization) + ": " + "UNDEFINED", false, false));
		draw_text(216, 405, format_text_basic(json_raw("owmenu.gold_alt", global.localization) + ": " + string(global.playerstats.gold), false, false));
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