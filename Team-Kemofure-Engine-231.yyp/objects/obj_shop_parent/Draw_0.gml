/// @description Drawing

if (misc.disableDrawing)
	exit;

draw_menu_rectangle(214, 125 - misc.smallBoxY, 319, 125, 4);
draw_menu_rectangle(0, 120, 320, 239, 4);
if (state != 2 && state != 4) {
	draw_menu_rectangle(214, 121, 319, 238, 3);
	
	draw_set_font(fnt_main);
	draw_set_color(c_white);
	global.textformat = [string(ds_list_size(global.playerinv)), "8"];
	draw_text_transformed(288, 216, format_text_basic(json_raw("shopmenu.itemcount", global.localization)), 0.5, 0.5, 0);
}

draw_set_font(fnt_main);
draw_set_color(c_white);
switch (state) {
	case 0:
		draw_text_transformed(240, 138, json_raw("shopmenu.buy", global.localization), 0.5, 0.5, 0);
		draw_text_transformed(240, 157, json_raw("shopmenu.sell", global.localization), 0.5, 0.5, 0);
		draw_text_transformed(240, 176, json_raw("shopmenu.talk", global.localization), 0.5, 0.5, 0);
		draw_text_transformed(240, 195, json_raw("shopmenu.exit", global.localization), 0.5, 0.5, 0);
		draw_sprite(spr_heartsmall, 0, 225, 142 + (19 * selection));
		break;
	case 1:
		draw_set_color(c_white);
		var itemName, itemInfo;
		for (var i = 0; i < array_length(strings.buyList); i++) {
			itemName[i] = item_get_name(strings.buyList[i]);
			itemInfo[i] = item_get_info(strings.buyList[i]);
			if (strings.stockList[i] != 0)
				draw_text_transformed(30, 134 + (19 * i), string(itemInfo[i].price) + "G - " + itemName[i], 0.5, 0.5, 0);
			else {
				draw_set_color(c_silver);
				draw_text_transformed(30, 134 + (19 * i), "-- SOLD OUT --", 0.5, 0.5, 0);
			}
			draw_set_color(c_white);
		}
		
		if (selection != array_length(strings.buyList))
			draw_sprite(spr_heartsmall, 0, 15, 138 + (19 * selection));
		else
			draw_sprite(spr_heartsmall, 0, 15, 215);
		
		draw_text_transformed(30, 211, json_raw("shopmenu.exit", global.localization), 0.5, 0.5, 0);
		break;
	case 2:
		if (!options.canSell)
			exit;
		
		switch (subState) {
			case 0:
				// Initialize the variables
				var item, itemName, itemInfo, optionString, w;
				for (var i = 0; i < ds_list_size(global.playerinv); i++) {
					item[i] = item_get_id(i);
					itemName[i] = item_get_name(item[i]);
					itemInfo[i] = item_get_info(item[i]);
					optionString = string(itemInfo[i].price) + "G - " + itemName[i];
					w = string_width(optionString);
				
					// Draw the text
					if (i < 2) {
						draw_text_transformed(	40 + (i % 2 != 0 ? (i * 160) : 0),
												138,
												optionString,
												(w < 80 ? 0.5 : (80 / w)),
												0.5,
												0);
					}
					else if (i < 4) {
						draw_text_transformed(	40 + (i % 2 != 0 ? 160 : 0),
												158,
												optionString,
												(w < 80 ? 0.5 : (80 / w)),
												0.5,
												0);
					}
					else if (i < 6) {
						draw_text_transformed(	40 + (i % 2 != 0 ? 160 : 0),
												178,
												optionString,
												(w < 80 ? 0.5 : (80 / w)),
												0.5,
												0);
					}
					else if (i < 8) {
						draw_text_transformed(	40 + (i % 2 != 0 ? 160 : 0),
												198,
												optionString,
												(w < 80 ? 0.5 : (80 / w)),
												0.5,
												0);
					}
				}
				
				if (selection != 8) {
					if (selection < 1) {
						draw_sprite(spr_heartsmall,
									0,
									25 + (selection % 2 != 0 ? 160 : 0),
									(selection % 2 == 0 ? 142 : 122));
					}
					else if (selection < 3) {
						draw_sprite(spr_heartsmall,
									0,
									25 + (selection % 2 != 0 ? 160 : 0),
									(selection % 2 == 0 ? 162 : 142));
					}
					else if (selection < 5) {
						draw_sprite(spr_heartsmall,
									0,
									25 + (selection % 2 != 0 ? 160 : 0),
									(selection % 2 == 0 ? 182 : 162));
					}
					else if (selection < 7) {
						draw_sprite(spr_heartsmall,
									0,
									25 + (selection % 2 != 0 ? 160 : 0),
									(selection % 2 == 0 ? 202 : 182));
					}
				}
				else
					draw_sprite(spr_heartsmall, 0, 15, 215);
				
				draw_text_transformed(30, 211, json_raw("shopmenu.exit", global.localization), 0.5, 0.5, 0);
				break;
			case 1:
				var confirm = "Yes";
				var deny = "No";
				
				draw_set_halign(fa_center);
				draw_set_valign(fa_bottom);
				draw_text_ext_transformed(room_width / 2, room_height / 1.4, strings.sellingQuestion, 36, 450, 0.5, 0.5, 0);
				
				draw_set_halign(fa_right);
				draw_set_valign(fa_top);
				draw_text_transformed(room_width / 2 - 40, room_height / 1.33, confirm, 0.5, 0.5, 0);
				
				draw_set_halign(fa_left);
				draw_text_transformed(room_width / 2 + 40, room_height / 1.33, deny, 0.5, 0.5, 0);
				
				if (selection == 0)
					draw_sprite(spr_heartsmall, 0, room_width / 2 - 35 - (string_width(confirm) / 2) - 18, room_height / 1.33 + 4);
					
				if (selection == 1)
					draw_sprite(spr_heartsmall, 0, room_width / 2 + 35 - 9, room_height / 1.33 + 4);
				break;
		}
		draw_set_color(c_yellow);
		draw_text_transformed(200, 211, "(" + string(global.playergold) + ")", 0.5, 0.5, 0);
		draw_set_color(c_white);
		break;
}
if (writer.writer != noone) || (instance_exists(writer.writer))
	draw_text_style(misc.mainTextX, misc.mainTextY, writer.writer.internalStr, c_white, writer.font, writer.charWidth, writer.charHeight, writer.textType, 0.5);