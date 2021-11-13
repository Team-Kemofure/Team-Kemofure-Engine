/// @description Initialize

event_inherited();			// Inherit the event
currDir = dir_down;			// Current direction
sprites = {					// Sprite list
	up : spr_npc_parent,
	down : spr_npc_parent,
	left : spr_npc_parent,
	right : spr_npc_parent,
	
	talk_up : spr_npc_parent_talk,
	talk_down : spr_npc_parent_talk,
	talk_left : spr_npc_parent_talk,
	talk_right : spr_npc_parent_talk
}