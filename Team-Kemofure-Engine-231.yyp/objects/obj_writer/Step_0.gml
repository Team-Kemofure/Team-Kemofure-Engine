/// @description Functionality

if (!completed) {
	if (pauseTimer > 0)
		pauseTimer--;
	else
		event_user(0); // Write the text
	
	while (skip)
		event_user(0);
}
