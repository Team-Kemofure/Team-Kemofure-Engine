/// @description Functionality

var u = key_up_press, d = key_down_press, l = key_left_press, r = key_right_press; // Initialize the keys
itemEnabled = (ds_list_size(global.inv_item) > 0);

// If the menu is not visible, then exit
if (!active) {
	mainState = 0;
	subState = 0;
	exit;
}

switch (mainState) {
	case 0: // ITEM, STAT and CELL
		// Selection functionality
		var prevSelection = selection;
		var maxSelection = (cellEnabled ? 2 : 1);
		
		if (u) selection = number_sub_wrap(selection, maxSelection);
		if (d) selection = number_add_wrap(selection, maxSelection);
		
		// Play a sound upon choosing
		if (prevSelection != selection)
			sfx_play(snd_menumove);
		
		// Confirming and proceeding to the next state
		if (key_enter_press) {
			switch (selection) {
				case 0:
					// Don't do anything if there are no items
					if (!itemEnabled)
						exit;
					
					mainState = 1;
					audio_play_sound(snd_menuselect, 10, false);
					break;
				case 1:
					mainState = 2;
					audio_play_sound(snd_menuselect, 10, false);
					break;
				case 2:
					mainState = 3;
					selection = 0;
					audio_play_sound(snd_menuselect, 10, false);
					break;
			}
		}
		
		if (key_shift_press) {
			active = false;
			global.canmove = true;
		}
		break;
	case 1:
		switch (subState) {
			case 0:
				var prevSelection = selection;
				var maxSelection = ds_list_size(global.inv_item) - 1;
				itemSelection = selection;
				
				// Selection functionality
				if (u) selection = number_sub_wrap(selection, maxSelection);
				if (d) selection = number_add_wrap(selection, maxSelection);
				
				// Play a sound upon choosing
				if (prevSelection != selection) && (maxSelection > 0) {
					sfx_play(snd_menumove);
				}
				
				// Exiting to the main menu
				if (key_shift_press) {
					mainState = 0;
					selection = 0;
				}
				
				// Choosing an item
				if (key_enter_press) {
					subState = 1;
					selection = 0;
					sfx_play(snd_menuselect);
					show_debug_message(itemSelection);
				}
				break;
			case 1:
				var prevSelection = selection;
				var maxSelection = 2;
				
				if (l) selection = number_sub_wrap(selection, maxSelection);
				if (r) selection = number_add_wrap(selection, maxSelection);
				
				// Play a sound upon choosing
				if (prevSelection != selection)
					sfx_play(snd_menumove);
				
				// Exiting from this sub state
				if (key_shift_press) {
					selection = itemSelection;
					subState = 0;
				}
				
				// Choosing an option
				if (key_enter_press) {
					switch (selection) {
						case 0:
							var item = ds_list_find_value(global.inv_item, itemSelection);
							global.textformat = [item_get_name(item), string(20)];
							
							cutscene_create(lang_array("owmenu.actions.item.use", global.cutscenejson));
							obj_cutscenehandler.sceneInfo[2] = [cutscene_run_text, "item.use.heal." + (item_get_info(item)[0] < (global.playermaxhp - global.playerhp) ? "part" : "all")];
							if (global.playerhp < global.playermaxhp)
								global.playerhp = clamp(global.playerhp, global.playerhp + item_get_info(item)[0], global.playermaxhp);
							
							item_remove(item);
							break;
						case 1:
							
							break;
					}
					subState = 2;
					show_debug_message(itemSelection);
				}
				break;
			case 2:
				if (obj_overworldui.state == 0) && (obj_cutscenehandler.sceneInfo == -1) {
					active = false;
					global.canmove = true;
				}
				break;
		}
		break;
	case 2:
		if (key_shift_press)
			mainState = 0;
		break;
	case 3:
		if (subState == 0) {
			// Selection functionality
			var prevSelection = selection;
			var maxSelection = ds_list_size(contactList) - 1;
			if (u) selection = number_sub_wrap(selection, maxSelection);
			if (d) selection = number_add_wrap(selection, maxSelection);
		
			// Play a sound upon choosing
			if (prevSelection != selection) && (maxSelection > 0)
				sfx_play(snd_menumove);
		
			// Exiting to the main menu
			if (key_shift_press) {
				mainState = 0;
				selection = 2;
			}
		
			// Calling someone from our contacts
			if (key_enter_press) {
				cutscene_create(lang_array(ds_list_find_value(contactList, selection), global.cutscenejson));
				subState = 1;
			}
		}
		else {
			if (obj_overworldui.state == 0) && (obj_cutscenehandler.sceneInfo == -1) {
				active = false;
				global.canmove = true;
			}
		}
		break;
}