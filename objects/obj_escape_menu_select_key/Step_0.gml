if (keyboard_check_pressed(vk_anykey)) {
	switch (key_ref) {
		case CON_MOVE_UP:
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
			obj_escape_menu.option[4, 0][2] = [key_translate(global.settings_move_up)];
			break;
		case CON_MOVE_DOWN:
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
			obj_escape_menu.option[4, 1][2] = [key_translate(global.settings_move_down)];
			break;
		case CON_MOVE_LEFT:
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
			obj_escape_menu.option[4, 2][2] = [key_translate(global.settings_move_left)];
			break;
		case CON_MOVE_RIGHT:
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
			obj_escape_menu.option[4, 3][2] = [key_translate(global.settings_move_right)];
			break;
		case CON_SPRINT:
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
			obj_escape_menu.option[4, 4][2] = [key_translate(global.settings_sprint)];
			break;
		case CON_INTERACT:
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
			obj_escape_menu.option[4, 5][2] = [key_translate(global.settings_interact)];
			break;
		case CON_OPEN_INVENTORY:
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
			obj_escape_menu.option[4, 6][2] = [key_translate(global.settings_open_inventory)];
			break;
		case CON_OPEN_SETTINGS:
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
			obj_escape_menu.option[4, 7][2] = [key_translate(global.settings_open_settings)];
			break;
		case CON_SKIP_DIALOGUE:
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
			obj_escape_menu.option[4, 8][2] = [key_translate(global.settings_skip_dialogue)];
			break;
	}
}

// Ensure Keys Are Clean

if (key_pressed && !keyboard_check_pressed(vk_anykey)) {
	obj_escape_menu.menu_frozen = false;
	instance_destroy();
}