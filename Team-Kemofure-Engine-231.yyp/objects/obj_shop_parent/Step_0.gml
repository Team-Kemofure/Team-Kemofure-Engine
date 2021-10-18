/// @description Functionality

var handler = obj_cutscenehandler;
var d = key_down_press, u = key_up_press,
	l = key_left_press, r = key_right_press;

if (key_shift_press) {
	if (instance_exists(writer.writer))
		writer.writer.skip = true;
}

switch (state) {
	case 0:
		var prev = selection;
		if (d) selection = number_add_wrap(selection, 3);
		if (u) selection = number_sub_wrap(selection, 3);
		if (prev != selection) sfx_play(snd_menumove);
		
		// Confirming an option
		if (key_enter_press) {
			subState = 0;
			if (selection == 1) && (item_get_id(0) == undefined) 
				exit; else state = selection + 1;
			selection = 0;
			sfx_play(snd_menuselect);
		}
		break;
	case 1:
		var prev = selection, _max = array_length(strings.buyList) - 1,
			itemInfo = item_get_info(strings.buyList[min(_max, selection)]);
		writer.writer.internalStr = "";
		writer.writer.msg = "";
		
		// Showing off the small box
		if (misc.smallBoxY < 86)
			misc.smallBoxY += 5;
		
		if (d) selection = number_add_wrap(selection, _max + 1);
		if (u) selection = number_sub_wrap(selection, _max + 1);
		if (key_enter_press) {
			if (selection == _max + 1) {
				cutscene_create(scenes.mainTextScene);
				selection = 0;
				state = 0;
			}
			else {
				if (strings.stockList[selection] != 0) {
					if (global.playerstats.gold >= itemInfo.price) {
						global.playerstats.gold -= itemInfo.price;
						strings.stockList[selection] -= 1;
						item_add(strings.buyList[selection]);
						sfx_play(snd_buy);
					}
				}
			}
		}
		break;
	case 2:
		if (options.canSell) {
			writer.writer.internalStr = "";
			writer.writer.msg = "";
			
			switch (subState) {
				case 0:
					prevSelection = selection;
					var prev = selection;
					
					if (l) {
						if (selection > 0) && (selection < 8)
							selection--;
					}
					
					if (r) {
						if (selection < ds_list_size(global.playerstats.inventory) - 1)
							selection++;
					}
					
					if (u) {
						if (selection > 1) && (selection < 8)
							selection -= 2;
						else
							selection = ds_list_size(global.playerstats.inventory) - 1;
					}
					
					if (d) {
						if (selection < ds_list_size(global.playerstats.inventory) - 2)
							selection += 2;
						else
							selection = 8;
					}
					
					if (key_enter_press) {
						if (selection < 8) {
							if (item_get_id(selection) != undefined) {
								prevSelection = selection;
								selection = 0;
								subState = 1;
							}
						}
						else {
							state = 0;
							selection = 1;
						}
					}
					
					if (key_shift_press) {
						cutscene_create(scenes.mainTextScene);
						selection = 1;
						state = 0;
					}
					
					if (prev != selection) sfx_play(snd_menumove);
					break;
				case 1:
					var prev = selection;
					if (l || r) selection = !selection;
					if (prev != selection) sfx_play(snd_menumove);
					
					if (key_enter_press) {
						switch (selection) {
							case 0:
								var item = item_get_id(prevSelection);
								global.playerstats.gold += item_get_info(item).price;
								item_remove(prevSelection);
								sfx_play(snd_buy);
								selection = clamp(selection, 0, ds_list_size(global.playerstats.inventory));
								break;
						}
						if (item_get_id(selection) != undefined) {
							if (selection == 1)
								selection = prevSelection;
							subState = 0;
						}
						else {
							cutscene_create(scenes.mainTextScene);
							selection = 1;
							state = 0;
						}
					}
					break;
			}
		}
		else {
			switch (subState) {
				case 0:
					instance_destroy(writer.writer);
					cutscene_create(scenes.sellingScene);
					subState = 1;
					break;
				case 1:
					if (writer.writer.completed && key_enter_press && handler.sceneInfo == -1) {
						cutscene_create(scenes.mainTextScene);
						state = 0;
					}
					break;
			}
		}
		break;
	case 4:
		switch (subState) {
			case 0: // Initializing the cutscene
				instance_destroy(writer.writer);
				cutscene_create(scenes.exitingScene);
				subState = 1;
				break;
			case 1: // Fading the screen upon pressing enter
				if (writer.writer.completed && key_enter_press && handler.sceneInfo == -1) {
					fade_screen(c_black, 0, 1, 0.3, true);
					subState = 2;
				}
				break;
			case 2: // Initializing the transition to the overworld
				if (obj_gamefader.completed) {
					room_goto(returning.returnRoom);
					global.enable_fading_scene = true;
					global.entrance_on_room_start = returning.returnTargetEntrance;
					global.direction_on_room_start = returning.returnTargetDirection;
				}
				break;
		}
		break;
}

if (state != 1) {
	if (misc.smallBoxY > 0)
		misc.smallBoxY -= 20;	
}