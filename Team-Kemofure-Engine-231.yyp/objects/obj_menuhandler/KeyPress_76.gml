var array = loadgame(), names = variable_struct_get_names(array);

global.playername = variable_struct_get(array, "name");
global.playerhp = variable_struct_get(array, "hp");
global.playerhpmax = variable_struct_get(array, "hp_max");
global.playerlv = variable_struct_get(array, "level");
global.playerexp = variable_struct_get(array, "experience");
global.playernext = variable_struct_get(array, "next");
global.playergold = variable_struct_get(array, "gold");
global.playerwep = variable_struct_get(array, "weapon");
global.playerarm = variable_struct_get(array, "armor");
global.playerat = variable_struct_get(array, "attack");
global.playerat_wep = variable_struct_get(array, "weapon_attack");
global.playerdf = variable_struct_get(array, "defense");
global.playerdf_arm = variable_struct_get(array, "armor_defense");
global.playerinv = variable_struct_get(array, "inventory");
global.currentroom = variable_struct_get(array, "currentroom");
global.time_seconds = variable_struct_get(array, "time_seconds");
global.time_minutes = variable_struct_get(array, "time_minutes");

//show_message(global.playerinv);
show_message(array);
show_message(global.playername);
show_message(global.playerhp);
//room_goto_next();