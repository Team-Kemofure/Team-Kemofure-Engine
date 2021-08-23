/// @description Initialization

currDir = dir_down;			// The direction we're facing
moveSpeed = 3;				// Our movement speed

image_index = 0;			// Reset the image index
image_speed = 0;			// Reset the image speed

// Adjust the camera
view_set_visible(0, true);
var cam = view_get_camera(0);

camera_set_view_size(cam, 320, 240);
camera_set_view_border(cam, 320, 240);
camera_set_view_target(cam, id);
view_set_wport(0, 640);
view_set_hport(0, 480);