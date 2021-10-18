/// @description Initialize

sceneInfo = -1;					// The scene info
scene = 0;						// The current scene number
timer = 0;						// The scene timer
x_dest = -1;					// X destination
y_dest = -1;					// Y destination

curveTimer = []; // Current amount of how much the animation curve has progressed
playAnimation = false; // Will we play an animation?
animationOrder = 0; // The current animation order
animationData = -1; // The current animation data