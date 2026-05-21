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

var _sel_item = option[menu_level, pos];

if (is_array(option[menu_level, pos])) {
	op_pos = _sel_item[1];
	op_pos += right_key - left_key;
		if (op_pos >= array_length(_sel_item[2])) { op_pos = 0 };
	if (op_pos < 0) { op_pos = array_length(_sel_item[2]) - 1 };
	_sel_item[1] = op_pos;
}

// Handle Accept On Option

if (accept_key) {
	var _sml = menu_level;
	
	switch (menu_level) {
		case STARTING_MENU:
			switch (pos) {
				case START_RESUME:
					global.paused = false;
					obj_player.settings_opened = false;
					instance_destroy();
					break;
				case START_SETTINGS:
					menu_level = 1;
					scroll = 0;
					break;
				case START_QUIT_GAME:
					game_end();
					break;
			}
			break;
		
		case SETTINGS_MENU:
			switch (pos) {
				case SET_GENERAL:
					menu_level = 2;
					scroll = 0;
					break;
				case SET_AUDIO:
					menu_level = 3;
					scroll = 0;
					break;
				case SET_CONTROLS:
					menu_level = 4;
					scroll = 0;
					break;
				case SET_BACK:
					menu_level = 0;
					scroll = 0;
					break;
			}
			break;
		
		case GENERAL_MENU:
			switch (pos) {
				case GEN_BACK:
					menu_level = 1;
					scroll = 0;
					break;
			}
			break;
		
		case AUDIO_MENU:
			switch (pos) {
				case AUD_BACK:
					menu_level = 1;
					scroll = 0;
					break;
			}
			break;
		
		case CONTROLS_MENU:
			if (pos == CON_BACK) {
				menu_level = 1;
				scroll = 0;
			} else { open_key_select(pos); }
			break;
	}
	
	if (_sml != menu_level) {pos = 0};
	op_length = array_length(option[menu_level]);
}

// Handle Left Right On Option

if (left_key || right_key) {
	switch (menu_level) {
		case GENERAL_MENU:
			switch (pos) {
				case GEN_WINDOW_MODE:
					global.settings_window_mode = _sel_item[1];
					switch (_sel_item[1]) {
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
				case GEN_ANTIALIASING:
					global.settings_antialiasing = _sel_item[1];
					switch (_sel_item[1]) {
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
				case GEN_VSYNC:
					global.settings_vertical_sync = _sel_item[1];
					switch (_sel_item[1]) {
						case 0: // Disabled
							display_reset(global.settings_antialiasing, 0);
							break;
						case 1: // Enabled
							display_reset(global.settings_antialiasing, 1);
							break;
					}
					break;
				case GEN_BRIGHTNESS:
					global.settings_brightness = _sel_item[1];
					break;
			}
			break;
		
		case AUDIO_MENU:
			switch (pos) {
				case AUD_MASTER_VOL:
					global.settings_master_volume = _sel_item[1];
					break;
				case AUD_MUSIC_VOL:
					global.settings_music_volume = _sel_item[1];
					break;
				case AUD_EFFECTS_VOL:
					global.settings_effects_volume = _sel_item[1];
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