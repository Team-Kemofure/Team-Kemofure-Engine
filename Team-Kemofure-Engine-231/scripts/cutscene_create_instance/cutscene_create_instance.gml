/// @param x
/// @param y
/// @param depth
/// @param obj
/// Creates an instance and proceeds to the next scene

var inst = instance_create_depth(argument[0], argument[1], argument[2], argument[3]);
cutscene_end_action();
return inst;