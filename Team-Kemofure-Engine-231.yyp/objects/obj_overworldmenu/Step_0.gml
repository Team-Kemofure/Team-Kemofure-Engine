/// @description Functionality

var u = key_up_press, d = key_down_press, l = key_left_press, r = key_right_press; // Initialize the keys

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
		
		if (d)
			selection = number_add_wrap(selection, maxSelection);
		if (u)
			selection = number_sub_wrap(selection, maxSelection);
		
		// Play a sound upon choosing
		if (prevSelection != selection)
			audio_play_sound(snd_menumove, 10, false);
		
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
			if (d)
				selection = number_add_wrap(selection, maxSelection);
			if (u)
				selection = number_sub_wrap(selection, maxSelection);
		
			// Play a sound upon choosing
			if (prevSelection != selection) && (maxSelection > 0)
				audio_play_sound(snd_menumove, 10, false);
		
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