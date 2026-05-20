// Handle Inputs

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);
accept_key = keyboard_check_pressed(vk_space);

// Navigate Menu

op_length = array_length(option[menu_level]);

pos += down_key - up_key;
if (pos >= op_length) { pos = 0 };
if (pos < 0 ) { pos = op_length - 1 };

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
				case 1: // Scaling
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