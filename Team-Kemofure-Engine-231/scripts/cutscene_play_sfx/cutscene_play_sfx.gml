/// @param soundid
/// Plays a sound effect and proceeds to the next scene

var sound = sfx_play(argument[0]);
cutscene_end_action();
return sound;