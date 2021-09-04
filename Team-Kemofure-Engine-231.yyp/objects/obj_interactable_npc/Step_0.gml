/// @description Additional Functionalities

event_inherited();

var ui = obj_overworldui;
if (ui.state == 1) {
	if ((global.currentinteraction == self.id) && (!ui.writer.completed))
		self.image_speed = 0.4;
	else {
		self.image_speed = 0;
		self.image_index = 0;
	}
}