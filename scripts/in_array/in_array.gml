/// @param array
/// @param value
/// Returns true if `val` exists in array `arr` (Code directly taken from TS!US)

var arr = argument[0];
var val = argument[1];

for (var i = array_length_1d(arr) - 1; i >= 0; i--)
    if (arr[i] == val)
        return true;
return false;