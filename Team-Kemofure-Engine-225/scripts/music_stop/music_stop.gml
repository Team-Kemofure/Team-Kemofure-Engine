/// Stops the current music
audio_destroy_stream(global.currentmusic);
global.currentmusic = -1;