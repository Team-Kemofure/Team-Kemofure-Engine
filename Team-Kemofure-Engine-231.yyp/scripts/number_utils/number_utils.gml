/// Adds a number but goes back to zero if it reaches beyond the maximum value
function number_add_wrap(val, maxVal) {
	if (val < maxVal)
		val++;
	else
		val = 0;

	return val;
}

/// Subtracts a number but goes back to its maximum value if it reaches under zero
function number_sub_wrap(val, maxVal) {
	if (val > 0)
		val--;
	else
		val = maxVal;

	return val;
}

/// Returns true if `val` exists in array `arr` (Prototype code, will be remade later)
function in_array(arr, val) {
	for (var i = array_length(arr) - 1; i >= 0; i--)
	    if (arr[i] == val)
	        return true;
	return false;
}