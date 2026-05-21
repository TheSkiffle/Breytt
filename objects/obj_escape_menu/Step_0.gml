// Check If Menu Frozen

if (menu_frozen) {
	exit;
}

// Handle Inputs

up_key = keyboard_check_pressed(global.settings_move_up);
down_key = keyboard_check_pressed(global.settings_move_down);
left_key = keyboard_check_pressed(global.settings_move_left);
right_key = keyboard_check_pressed(global.settings_move_right);
accept_key = keyboard_check_pressed(global.settings_interact);
leave_key = keyboard_check_pressed(global.settings_open_settings);

// Navigate Menu

if (leave_key) {
	leave_key_pressed = true;
}

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if (pos >= op_length) { pos = 0 };
if (pos < 0 ) { pos = op_length - 1 };

if (is_array(option[menu_level, pos])) {
	op_pos = option[menu_level, pos][1];
	op_pos += right_key - left_key;
		if (op_pos >= array_length(option[menu_level, pos][2])) { op_pos = 0 };
	if (op_pos < 0) { op_pos = array_length(option[menu_level, pos][2]) - 1 };
	option[menu_level, pos][1] = op_pos;
}

// Handle Accept On Option

if (accept_key) {
	var _sml = menu_level;
	
	switch (menu_level) {
		case 0: // Starting Menu
			switch (pos) {
				case 0: // Resume
					global.paused = false;
					obj_player.settings_opened = false;
					instance_destroy();
					break;
				case 1: // Settings
					menu_level = 1;
					scroll = 0;
					break;
				case 2: // Quit Game
					game_end();
					break;
			}
			break;
		
		case 1: // Settings Menu
			switch (pos) {
				case 0: // General
					menu_level = 2;
					scroll = 0;
					break;
				case 1: // Audio
					menu_level = 3;
					scroll = 0;
					break;
				case 2: // Controls
					menu_level = 4;
					scroll = 0;
					break;
				case 3: // Back
					menu_level = 0;
					scroll = 0;
					break;
			}
			break;
		
		case 2: // General Menu
			switch (pos) {
				case 0: // Window Mode
					[]
					break;
				case 1: // Anti-Aliasing
					[]
					break;
				case 2: // Vertical Sync
					[]
					break;
				case 3: // Brightness
					[]
					break;
				case 4: // Back
					menu_level = 1;
					scroll = 0;
					break;
			}
			break;
		
		case 3: // Audio Menu
			switch (pos) {
				case 0: // Master Volume
					[]
					break;
				case 1: // Music Volume
					[]
					break;
				case 2: // Effects Volume
					[]
					break;
				case 3: // Back
					menu_level = 1;
					scroll = 0;
					break;
			}
			break;
		
		case 4: // Controls Menu
			var _key_select = noone;
			switch (pos) {
				case 0: // Move Up
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Move Up";
					menu_frozen = true;
					break;
				case 1: // Move Down
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Move Down";
					menu_frozen = true;
					break;
				case 2: // Move Left
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Move Left";
					menu_frozen = true;
					break;
				case 3: // Move Right
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Move Right";
					menu_frozen = true;
					break;
				case 4: // Sprint
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Sprint";
					menu_frozen = true;
					break;
				case 5: // Interact
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Interact";
					menu_frozen = true;
					break;
				case 6: // Open Inventory
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Open Inventory";
					menu_frozen = true;
					break;
				case 7: // Open Settings
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Open Settings";
					menu_frozen = true;
					break;
				case 8: // Skip Dialogue
					_key_select = instance_create_depth(display_get_gui_width() / 2, display_get_gui_height() / 2, -9999, obj_escape_menu_select_key);
					_key_select.key_ref = "Skip Dialogue";
					menu_frozen = true;
					break;
				case 9: // Back
					menu_level = 1;
					scroll = 0;
					break;
			}
			break;
	}
	
	if (_sml != menu_level) {pos = 0};
	op_length = array_length(option[menu_level]);
}

// Handle Left Right On Option

if (left_key || right_key) {
	switch (menu_level) {
		case 2: // General Menu
			switch (pos) {
				case 0: // Window Mode
					global.settings_window_mode = option[menu_level, pos][1];
					switch (option[menu_level, pos][1]) {
						case 0: // Windowed
							window_enable_borderless_fullscreen(true);
							window_set_fullscreen(false);
							break;
						case 1: // Windowed Borderless
							window_enable_borderless_fullscreen(true);
							window_set_fullscreen(true);
							break;
						case 2: // Fullscreen
							window_enable_borderless_fullscreen(false);
							window_set_fullscreen(true);
							break;
					}
					break;
				case 1: // Anti-Aliasing
					global.settings_antialiasing = option[menu_level, pos][1];
					switch (option[menu_level, pos][1]) {
						case 0: // Disabled
							display_reset(0, global.settings_vertical_sync);
							break;
						case 1: // 2x
							display_reset(2, global.settings_vertical_sync);
							break;
						case 2: // 4x
							display_reset(4, global.settings_vertical_sync);
							break;
						case 3: // 8x
							display_reset(8, global.settings_vertical_sync);
							break;
					}
					break;
				case 2: // Vertical Sync
					global.settings_vertical_sync = option[menu_level, pos][1];
					switch (option[menu_level, pos][1]) {
						case 0: // Disabled
							display_reset(global.settings_antialiasing, 0);
							break;
						case 1: // Enabled
							display_reset(global.settings_antialiasing, 1);
							break;
					}
					break;
				case 3: // Brightness
					global.settings_brightness = option[menu_level, pos][1];
					break;
			}
			break;
		
		case 3: // Audio Menu
			switch (pos) {
				case 0: // Master Volume
					global.settings_master_volume = option[menu_level, pos][1];
					break;
				case 1: // Music Volume
					global.settings_music_volume = option[menu_level, pos][1];
					break;
				case 2: // Effects Volume
					global.settings_effects_volume = option[menu_level, pos][1];
					break;
			}
			break;
		
		case 4: // Controls Menu
			switch (pos) {
				case 0: // Move Up
					[]
					break;
				case 1: // Move Down
					[]
					break;
				case 2: // Move Left
					[]
					break;
				case 3: // Move Right
					[]
					break;
				case 4: // Sprint
					[]
					break;
				case 5: // Interact
					[]
					break;
				case 6: // Open Inventory
					[]
					break;
				case 7: // Open Settings
					[]
					break;
				case 8: // Skip Dialogue
					[]
					break;
			}
			break;
	}
}

// Ensure Keys Are Clean

if (leave_key_pressed && !leave_key) {
	global.paused = false;
	obj_player.settings_opened = false;
	instance_destroy();
}