/// @param seconds
/// Delays a cutscene by a given amount

with (obj_cutscenehandler) {
	timer++;
	if (timer >= argument[0] * room_speed) {
		timer = 0;
		cutscene_end_action();
	}
}