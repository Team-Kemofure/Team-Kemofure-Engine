/// @param val
/// @param maxVal
/// Subtracts a number but goes back to its maximum value if it reaches under zero

var val = argument[0];
var maxVal = argument[1];

if (val > 0)
	val--;
else
	val = maxVal;

return val;