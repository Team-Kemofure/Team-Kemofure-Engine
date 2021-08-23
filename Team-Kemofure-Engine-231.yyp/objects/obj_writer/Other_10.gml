/// @description Write

var len = string_length(msg);
if (internalPos < len)
{
	var char = string_char_at(msg, ++internalPos);
	switch (char) {
		case "`":
			var cmdType = string_char_at(msg, ++internalPos);
			switch (cmdType) {
				case "p": // Pausing
					pauseTimer = real(string_char_at(msg, ++internalPos)) * 10;
					internalPos++;
					break;
				default:
					internalStr += "`" + cmdType;
					while (string_char_at(msg, internalPos + 1) != "`") && (!completed)
						internalStr += string_char_at(msg, ++internalPos);
					internalStr += "`";
					internalPos++;
					break;
			}
			break;
		default:
			internalStr += char;
			if (voice != noone) {
				for (var i = 0; i < array_length_1d(voice); i++)
					audio_stop_sound(voice[i]);
				if (char != " ")
					audio_play_sound(voice[random(array_length_1d(voice))], 8, false);
			}
			pauseTimer = textSpeed;
			break;
	}
}
else {
	completed = true;
	skip = false;
}