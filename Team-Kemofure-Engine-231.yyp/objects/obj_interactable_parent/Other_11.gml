/// @description Collision Setup

// Exit the event if it's not collideable
if (!collideable) exit;

// Set things up
var w = sprite_width, h = sprite_height;
col = instance_create_depth(x - (w / 2), y + (h / 2), 0, obj_npc_solid);
col.image_xscale *= w / 20;	// Divide the X scale by our X scale
col.image_yscale *= (h / 20) / 2;	// Divide the Y scale by our Y scale
col.image_yscale *= -1;	// Multiply the Y scale to -1