/// @description Handle the cutscenes

if (sceneInfo != -1) {
	var currentScene = sceneInfo[scene];
	var len = array_length_1d(currentScene) - 1;
	global.scene = true;
	
	switch (len) {
		case 0: script_execute(currentScene[0]); break;
		case 1: script_execute(currentScene[0], currentScene[1]); break;
		case 2: script_execute(currentScene[0], currentScene[1], currentScene[2]); break;
		case 3: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3]); break;
		case 4: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4]); break;
		case 5: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5]); break;
		case 6: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6]); break;
		case 7: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7]); break;
		case 8: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8]); break;
		case 9: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9]); break;
		case 10: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10]); break;
		case 11: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10], currentScene[11]); break;
		case 12: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10], currentScene[11], currentScene[12]); break;
		case 13: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10], currentScene[11], currentScene[12], currentScene[13]); break;
		case 14: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10], currentScene[11], currentScene[12], currentScene[13], currentScene[14]); break;
		case 15: script_execute(currentScene[0], currentScene[1], currentScene[2], currentScene[3], currentScene[4], currentScene[5], currentScene[6], currentScene[7], currentScene[8], currentScene[9], currentScene[10], currentScene[11], currentScene[12], currentScene[13], currentScene[14], currentScene[15]); break;
	}
}
else
	global.scene = false;