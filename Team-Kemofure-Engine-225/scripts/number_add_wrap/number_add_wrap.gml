/// @param val
/// @param maxVal
/// Adds a number but goes back to zero if it reaches beyond the maximum value

var val = argument[0];
var maxVal = argument[1];

if (val < maxVal)
	val++;
else
	val = 0;

return val;