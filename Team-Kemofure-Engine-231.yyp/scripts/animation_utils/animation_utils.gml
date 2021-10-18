// This script creates an animation on an instance relatively to the variable's value
function create_instance_animation(instance, variable, targetValue, curveSubName, seconds) {
	var handler = instance_create_depth(0, 0, 0, obj_animationhandler);
	with (handler) {
		curveTimer = 0;
		animationData = {
			curveName : curveSubName,
			targetInstance : instance,
			targetVariable : variable,
			oldValue : variable_instance_get(instance, variable),
			newValue : targetValue,
			duration : seconds
		};
	}
}
