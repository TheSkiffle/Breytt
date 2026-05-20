// Handle Inputs

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
left_key = keyboard_check_pressed(vk_left);
right_key = keyboard_check_pressed(vk_right);
accept_key = keyboard_check_pressed(vk_space);

// Navigate Menu

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
				case 0: // Start Game
					TransitionStart(rm_spawn, sq_fadeout, sq_fadein);
					break;
				case 1: // Settings
					menu_level = 1;
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
					break;
				case 1: // Audio
					menu_level = 3;
					break;
				case 2: // Controls
					menu_level = 4;
					break;
				case 3: // Back
					menu_level = 0;
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
				case 3: // Back
					menu_level = 1;
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
				case 9: // Back
					menu_level = 1;
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