/// @param function
/// @param x
/// Uses a tweening function to move the value
function ease() {

	var _function = argument[0], xx = argument[1];
	var xx2 = xx * 2, xxm1 = xx - 1;

	if (xx <= 0) return 0;
	if (xx >= 1) return 1;

	switch (_function) {
		case "Linear":
			return xx;
			break;

		case "Instant":
			return 0;
			break;
		
		case "EaseInQuad":
			return xx*xx
			break;
		
		case "EaseOutQuad":
			return -xx*(xx-2)
			break;
		
		case "EaseInOutQuad":
			if (xx2<1)
			    return 1/2*xx2*xx2
			return -1/2*((xx2-1)*(xx2-3)-1)
			break;
		
		case "EaseInCubic":
			return xx*xx*xx
			break;
		
		case "EaseOutCubic":
			return ((xxm1)*xxm1*xxm1+1)
			break;
		
		case "EaseInOutCubic":
			if (xx2<1)
				return 1/2*xx2*xx2*xx2
			return 1/2*((xx2-2)*(xx2-2)*(xx2-2)+2)
			break;
		
		case "EaseInQuart":
			return xx*xx*xx*xx
			break;
		case "EaseOutQuart":
			return -((xxm1)*xxm1*xxm1*xxm1-1)
			break;
		
		case "EaseInOutquart":
			if (xx2<1)
			    return 1/2*xx2*xx2*xx2*xx2
			return -1/2*((xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)-2)
			break;
		
		case "EaseInQuint":
			return xx*xx*xx*xx*xx
			break;
		
		case "EaseOutQuint":
			return ((xxm1)*xxm1*xxm1*xxm1*xxm1+1)
			break;
		
		case "EaseInOutQuint":
			if (xx2<1)
			    return 1/2*xx2*xx2*xx2*xx2*xx2
			return 1/2*((xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)*(xx2-2)+2)
			break;
		
		case "EaseInSine":
			return -cos(xx*(pi/2))+1
			break;
		
		case "EaseOutSine":
			return sin(xx*(pi/2))
			break;
	
		case "EaseInOutSine":
			return -1/2*(cos(pi*xx/1)-1)
			break;
		
		case "EaseInExpo":
			return power(2,10*(xx-1))
			break;
	
		case "EaseOutExpo":
			return -power(2,-10*xx)+1
			break;
		
		case "EaseInOutExpo":
			if (xx2<1)
				return 1/2*power(2,10*(xx2-1))
			return 1/2*(-power(2,-10*(xx2-1))+2)
			break;
	
		case "EaseInCirc":
			return -(sqrt(1-xx*xx)-1)
			break;
		
		case "EaseOutCirc":
			return sqrt(1-(xxm1)*xxm1)
			break;
		
		case "EaseInOutcirc":
			if (xx2<1)
			    return -1/2*(sqrt(1-xx2*xx2)-1)
			return 1/2*(sqrt(max(0,1-(xx2-2)*(xx2-2)))+1)
			break;
		
		case "EaseInElastic":
			var p=0.3;
			var s=p/(2*pi)*arcsin(1);
			return -(power(2,10*(xx-1))*sin(((xx-1)*1-s)*(2*pi)/p))
			break;
		
		case "EaseOutElastic":
			var p=0.3;
			var s=p/(2*pi)*arcsin(1);
			return power(2,-10*xx)*sin((xx*1-s)*(2*pi)/p)+1
			break;
		
		case "EaseInOutElastic":
			var p=0.3*1.5;
			var s = p/(2*pi)*arcsin(1);
			if (xx2<1)
				return -0.5*(power(2,10*(xx2-1))*sin(((xx2-1)*1-s)*(2*pi)/p))
			return power(2,-10*(xx2-1))*sin(((xx2-1)*1-s)*(2*pi)/p)*0.5+1
			break;
		
		case "EaseInBack":
			var s=1.70158;
			return xx*xx*((s+1)*xx-s)

		case "EaseOutBack":
			var s=1.70158;
			return (xxm1*xxm1*((s+1)*xxm1+s)+1)
			break;
		
		case "EaseInOutBack":
			var s=1.70158; 
			if (xx2<1)
			    return 1/2*(xx2*xx2*(((s*(1.525))+1)*xx2-(s*(1.525))))
			return 1/2*((xx2-2)*(xx2-2)*(((s*(1.525))+1)*(xx2-2)+(s*(1.525)))+2)
			break;
		
		case "EaseInBounce":
			xx=1-xx
			if (xx<(1/2.75))
			    return 1-(7.5625*xx*xx)
			else if (xx<(2/2.75))
			    return 1-(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
			else if (xx<(2.5/2.75))
			    return 1-(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
			else
			    return 1-(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
			break;
		case "EaseOutBounce":
			if (xx<(1/2.75))
			    return (7.5625*xx*xx)
			else if (xx<(2/2.75))
			    return (7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
			else if (xx<(2.5/2.75))
			    return (7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
			else
			    return (7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
			break;
		case "EaseInOutBounce":
			var ret;
			if (xx<1/2) {
			    xx*=2
				xx=1-xx
			    if (xx<(1/2.75))
		        ret=(7.5625*xx*xx)
			    else if (xx < (2/2.75))
			        ret=(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
			    else if (xx < (2.5/2.75))
			        ret=(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
			    else
			        ret=(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
			    ret=1-ret
			    ret*=.5
			} else {
			    xx=xx*2-1
			    if (xx<(1/2.75))
					ret=(7.5625*xx*xx)
			    else if (xx < (2/2.75))
			        ret=(7.5625*(xx-(1.5/2.75))*(xx-(1.5/2.75))+0.75)
			    else if (xx < (2.5/2.75))
					ret=(7.5625*(xx-(2.25/2.75))*(xx-(2.25/2.75))+0.9375)
				else
				    ret=(7.5625*(xx-(2.625/2.75))*(xx-(2.625/2.75))+0.984375)
				ret*=0.5 
				ret+=0.5
			}
			return ret;
			break;
	}

	return xx;


}
