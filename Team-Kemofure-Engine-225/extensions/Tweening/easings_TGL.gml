#define Default_Ease_Algorithms
/*
* TERMS OF USE - EASING EQUATIONS
* Open source under the BSD License.
* Copyright (c)2001 Robert Penner
* All rights reserved.
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
* Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

/*
It is advised to add custom easing algorithms independent of Default_Ease_Algorithms
*/

/*
For visual graphs use: http://easings.net/
*/

/*
Created by TinyGamesLab, based on code by http://davetech.co.uk
*/

#define EaseLinear
/// EaseLinear(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * argument[0] / argument[1] + argument[2];

#define EaseInQuad
/// EaseInQuad(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1];
return argument[3] * argument[0] * argument[0] + argument[2];

#define EaseOutQuad
/// EaseOutQuad(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1];
return -argument[3] * argument[0] * (argument[0] - 2) + argument[2];

#define EaseInOutQuad
/// EaseInOutQuad(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1)
{
    return argument[3] * 0.5 * argument[0] * argument[0] + argument[2];
}

return argument[3] * -0.5 * (--argument[0] * (argument[0] - 2) - 1) + argument[2];


#define EaseInCubic
/// EaseInCubic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * power(argument[0]/argument[1], 3) + argument[2];

#define EaseOutCubic
/// EaseOutCubic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * (power(argument[0]/argument[1] - 1, 3) + 1) + argument[2];

#define EaseInOutCubic
/// EaseInOutCubic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1)
{
   return argument[3] * 0.5 * power(argument[0], 3) + argument[2];
}

return argument[3] * 0.5 * (power(argument[0] - 2, 3) + 2) + argument[2];

#define EaseInQuart
/// EaseInQuart(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * power(argument[0] / argument[1], 4) + argument[2];

#define EaseOutQuart
/// EaseOutQuart(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return -argument[3] * (power(argument[0] / argument[1] - 1, 4) - 1) + argument[2];

#define EaseInOutQuart
/// EaseInOutQuart(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1) 
{
    return argument[3] * 0.5 * power(argument[0], 4) + argument[2];
}

return argument[3] * -0.5 * (power(argument[0] - 2, 4) - 2) + argument[2];

#define EaseInQuint
/// EaseInQuint(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * power(argument[0] / argument[1], 5) + argument[2];

#define EaseOutQuint
/// EaseOutQuint(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * (power(argument[0] / argument[1] - 1, 5) + 1) + argument[2];

#define EaseInOutQuint
/// EaseInOutQuint(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1)
{
    return argument[3] * 0.5 * power(argument[0], 5) + argument[2];
}

return argument[3] * 0.5 * (power(argument[0] - 2, 5) + 2) + argument[2];

#define EaseInSine
/// EaseInSine(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * (1 - cos(argument[0] / argument[1] * (pi / 2))) + argument[2];

#define EaseOutSine
/// EaseOutSine(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * sin(argument[0] / argument[1] * (pi / 2)) + argument[2];

#define EaseInOutSine
/// EaseInOutSine(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * 0.5 * (1 - cos(pi * argument[0] / argument[1])) + argument[2];

#define EaseInCirc
/// EaseInCirc(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1];
return argument[3] * (1 - sqrt(1 - argument[0] * argument[0])) + argument[2];

#define EaseOutCirc
/// EaseOutCirc(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] = argument[0] / argument[1] - 1;
return argument[3] * sqrt(1 - argument[0] * argument[0]) + argument[2];

#define EaseInOutCirc
/// EaseInOutCirc(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1)
{
    return argument[3] * 0.5 * (1 - sqrt(1 - argument[0] * argument[0])) + argument[2];
}

argument[0] -= 2;
return argument[3] * 0.5 * (sqrt(1 - argument[0] * argument[0]) + 1) + argument[2];

#define EaseInExpo
/// EaseInExpo(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * power(2, 10 * (argument[0] / argument[1] - 1)) + argument[2];

#define EaseOutExpo
/// EaseOutExpo(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

return argument[3] * (-power(2, -10 * argument[0] / argument[1]) + 1) + argument[2];

#define EaseInOutExpo
/// EaseInOutExpo(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1] * 0.5;

if (argument[0] < 1) 
{
    return argument[3] * 0.5 * power(2, 10 * --argument[0]) + argument[2];
}

return argument[3] * 0.5 * (-power(2, -10 * --argument[0]) + 2) + argument[2];

#define EaseInElastic
/// EaseInElastic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;
var _p = 0;
var _a = argument[3];

if (argument[0] == 0 || _a == 0) 
{
    return argument[2]; 
}

argument[0] /= argument[1];

if (argument[0] == 1) 
{
    return argument[2]+argument[3]; 
}

if (_p == 0) 
{
    _p = argument[1]*0.3;
}

if (_a < abs(argument[3])) 
{ 
    _a = argument[3]; 
    _s = _p*0.25; 
}
else
{
    _s = _p / (2 * pi) * arcsin (argument[3] / _a);
}

return -(_a * power(2,10 * (--argument[0])) * sin((argument[0] * argument[1] - _s) * (2 * pi) / _p)) + argument[2];

#define EaseOutElastic
/// EaseOutElastic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;
var _p = 0;
var _a = argument[3];

if (argument[0] == 0 || _a == 0)
{
    return argument[2];
}

argument[0] /= argument[1];

if (argument[0] == 1)
{
    return argument[2] + argument[3];
}

if (_p == 0)
{
    _p = argument[1] * 0.3;
}

if (_a < abs(argument[3])) 
{ 
    _a = argument[3];
    _s = _p * 0.25; 
}
else 
{
    _s = _p / (2 * pi) * arcsin (argument[3] / _a);
}

return _a * power(2, -10 * argument[0]) * sin((argument[0] * argument[1] - _s) * (2 * pi) / _p ) + argument[3] + argument[2];

#define EaseInOutElastic
/// EaseInOutElastic(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;
var _p = 0;
var _a = argument[3];

if (argument[0] == 0 || _a == 0)
{
    return argument[2];
}

argument[0] /= argument[1]*0.5;

if (argument[0] == 2)
{
    return argument[2]+argument[3]; 
}

if (_p == 0)
{
    _p = argument[1] * (0.3 * 1.5);
}

if (_a < abs(argument[3])) 
{ 
    _a = argument[3]; 
    _s = _p * 0.25; 
}
else
{
    _s = _p / (2 * pi) * arcsin (argument[3] / _a);
}

if (argument[0] < 1)
{
    return -0.5 * (_a * power(2, 10 * (--argument[0])) * sin((argument[0] * argument[1] - _s) * (2 * pi) / _p)) + argument[2];
}

return _a * power(2, -10 * (--argument[0])) * sin((argument[0] * argument[1] - _s) * (2 * pi) / _p) * 0.5 + argument[3] + argument[2];

#define EaseInBack
/// EaseInBack(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;

argument[0] /= argument[1];
return argument[3] * argument[0] * argument[0] * ((_s + 1) * argument[0] - _s) + argument[2];

#define EaseOutBack
/// EaseOutBack(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;

argument[0] = argument[0]/argument[1] - 1;
return argument[3] * (argument[0] * argument[0] * ((_s + 1) * argument[0] + _s) + 1) + argument[2];

#define EaseInOutBack
/// EaseInOutBack(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

var _s = 1.70158;

argument[0] = argument[0]/argument[1]*2

if (argument[0] < 1)
{
    _s *= 1.525;
    return argument[3] * 0.5 * (argument[0] * argument[0] * ((_s + 1) * argument[0] - _s)) + argument[2];
}

argument[0] -= 2;
_s *= 1.525

return argument[3] * 0.5 * (argument[0] * argument[0] * ((_s + 1) * argument[0] + _s) + 2) + argument[2];

#define EaseInBounce
/// EaseInBounce(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
    if (argument[4]) {
    argument[3] = argument[3] - argument[2];
    }
    return argument[3] - EaseOutBounce(argument[1] - argument[0], argument[1], 0, argument[3], argument[4]) + argument[2]
} else {
    return argument[3] - EaseOutBounce(argument[1] - argument[0], argument[1], 0, argument[3]) + argument[2]
}


#define EaseOutBounce
/// EaseOutBounce(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
}

argument[0] /= argument[1];

if (argument[0] < 1/2.75)
{
    return argument[3] * 7.5625 * argument[0] * argument[0] + argument[2];
}
else
if (argument[0] < 2/2.75)
{
    argument[0] -= 1.5/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.75) + argument[2];
}
else
if (argument[0] < 2.5/2.75)
{
    argument[0] -= 2.25/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.9375) + argument[2];
}
else
{
    argument[0] -= 2.625/2.75;
    return argument[3] * (7.5625 * argument[0] * argument[0] + 0.984375) + argument[2];
}


#define EaseInOutBounce
/// EaseInOutBounce(current time,duration,start value,change in value, [absolute = false])
if (argument_count>4) {
	if (argument[4]) {
		argument[3] = argument[3] - argument[2];
	}
	if (argument[0] < argument[1]*0.5) 
	{
		return (EaseInBounce(argument[0]*2,  argument[1], 0, argument[3], argument[4])*0.5 + argument[2]);
	}
	return (EaseOutBounce(argument[0]*2 - argument[1], argument[1], 0, argument[3], argument[4])*0.5 + argument[3]*0.5 + argument[2]);
} else {
	if (argument[0] < argument[1]*0.5) 
	{
		return (EaseInBounce(argument[0]*2, argument[1], 0, argument[3])*0.5 + argument[2]);
	}
	return (EaseOutBounce(argument[0]*2 - argument[1], argument[1], 0, argument[3])*0.5 + argument[3]*0.5 + argument[2]);
}



