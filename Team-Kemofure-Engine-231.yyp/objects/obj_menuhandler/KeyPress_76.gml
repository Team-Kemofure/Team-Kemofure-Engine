var array = loadgame();

global.playername = array[0];
global.playerhp = array[1];
global.playerhpmax = array[2];
global.playerlv = array[3];
global.playerexp = array[4];
global.playernext = array[5];
global.playergold = array[6];
global.playerwep = array[7];
global.playerarm = array[8];
global.playerat = array[9];
global.playerat_wep = array[10];
global.playerdf = array[11];
global.playerdf_arm = array[12];
global.playerinv = array[13];
global.currentroom = array[14];
global.time_seconds = array[15];
global.time_minutes = array[16];

room_goto_next();