if (keyboard_check_pressed(vk_anykey)) {
	switch (key_ref) {
		case "Move Up":
			if ((keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_move_up = keyboard_key;
			obj_menu.option[4, 0][2] = [key_translate(global.settings_move_up)];
			break;
		case "Move Down":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_move_down = keyboard_key;
			obj_menu.option[4, 1][2] = [key_translate(global.settings_move_down)];
			break;
		case "Move Left":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_move_left = keyboard_key;
			obj_menu.option[4, 2][2] = [key_translate(global.settings_move_left)];
			break;
		case "Move Right":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_move_right = keyboard_key;
			obj_menu.option[4, 3][2] = [key_translate(global.settings_move_right)];
			break;
		case "Sprint":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_sprint = keyboard_key;
			obj_menu.option[4, 4][2] = [key_translate(global.settings_sprint)];
			break;
		case "Interact":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_interact = keyboard_key;
			obj_menu.option[4, 5][2] = [key_translate(global.settings_interact)];
			break;
		case "Open Inventory":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_settings) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_open_inventory = keyboard_key;
			obj_menu.option[4, 6][2] = [key_translate(global.settings_open_inventory)];
			break;
		case "Open Settings":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_skip_dialogue)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_open_settings = keyboard_key;
			obj_menu.option[4, 7][2] = [key_translate(global.settings_open_settings)];
			break;
		case "Skip Dialogue":
			if ((keyboard_key == global.settings_move_up) ||
				(keyboard_key == global.settings_move_down) ||
				(keyboard_key == global.settings_move_left) ||
				(keyboard_key == global.settings_move_right) ||
				(keyboard_key == global.settings_sprint) ||
				(keyboard_key == global.settings_interact) ||
				(keyboard_key == global.settings_open_inventory) ||
				(keyboard_key == global.settings_open_settings)) {
				key_already_used = true;
				break;
			}
			key_pressed = true;
			global.settings_skip_dialogue = keyboard_key;
			obj_menu.option[4, 8][2] = [key_translate(global.settings_skip_dialogue)];
			break;
	}
}

if (key_pressed && !keyboard_check_pressed(vk_anykey)) {
	obj_menu.menu_frozen = false;
	instance_destroy();
}