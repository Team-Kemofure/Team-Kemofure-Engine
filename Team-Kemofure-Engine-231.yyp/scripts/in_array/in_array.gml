/// @param array
/// @param value
/// Returns true if `val` exists in array `arr` (Prototype code, will be remade later)
function in_array() {

	var arr = argument[0];
	var val = argument[1];

	for (var i = array_length(arr) - 1; i >= 0; i--)
	    if (arr[i] == val)
	        return true;
	return false;


}
