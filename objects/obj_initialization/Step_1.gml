/// @description Other Functionalities

// Global variables for keybinds
global.keyboard_keys = [ord("Z"), ord("X"), ord("C"), vk_up, vk_down, vk_left, vk_right];	// The list of the keys we can press

#macro key_enter (keyboard_check(global.keyboard_keys[0]))
#macro key_enter_press (keyboard_check_pressed(global.keyboard_keys[0]))
#macro key_enter_release (keyboard_check_released(global.keyboard_keys[0]))

#macro key_shift (keyboard_check(global.keyboard_keys[1]))
#macro key_shift_press (keyboard_check_pressed(global.keyboard_keys[1]))
#macro key_shift_release (keyboard_check_released(global.keyboard_keys[1]))

#macro key_ctrl (keyboard_check(global.keyboard_keys[2]))
#macro key_ctrl_press (keyboard_check_pressed(global.keyboard_keys[2]))
#macro key_ctrl_release (keyboard_check_released(global.keyboard_keys[2]))

#macro key_up (keyboard_check(global.keyboard_keys[3]))
#macro key_up_press (keyboard_check_pressed(global.keyboard_keys[3]))
#macro key_up_release (keyboard_check_released(global.keyboard_keys[3]))

#macro key_down (keyboard_check(global.keyboard_keys[4]))
#macro key_down_press (keyboard_check_pressed(global.keyboard_keys[4]))
#macro key_down_release (keyboard_check_released(global.keyboard_keys[4]))

#macro key_left (keyboard_check(global.keyboard_keys[5]))
#macro key_left_press (keyboard_check_pressed(global.keyboard_keys[5]))
#macro key_left_release (keyboard_check_released(global.keyboard_keys[5]))

#macro key_right (keyboard_check(global.keyboard_keys[6]))
#macro key_right_press (keyboard_check_pressed(global.keyboard_keys[6]))
#macro key_right_release (keyboard_check_released(global.keyboard_keys[6]))