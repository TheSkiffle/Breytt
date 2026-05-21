// Init Variables

min_width = 0;
min_height = 0;
max_width = infinity;
max_height = 384;
width = 0;
height = 0;

op_border = 8;
op_space = 16;
scale = 4;

pos = 0;
scroll = 0;

menu_frozen = false;
leave_key_pressed = false;

// Starting Menu

option[0, 0] = "Resume";
option[0, 1] = "Settings";
option[0, 2] = "Quit Game";

// Settings Menu

option[1, 0] = "General";
option[1, 1] = "Audio";
option[1, 2] = "Controls";
option[1, 3] = "Back";

// General Menu

option[2, 0] = ["Window Mode: ", global.settings_window_mode, ["Windowed", "Windowed Borderless", "Fullscreen"]];
option[2, 1] = ["Anti-Aliasing: ", global.settings_antialiasing, ["Disabled", "2x (if supported)", "4x (if supported)", "8x (if supported)"]];
option[2, 2] = ["Vertical Sync: ", global.settings_vertical_sync, ["Disabled", "Enabled"]];
option[2, 3] = ["Brightness: ", global.settings_brightness, array_create_ext(201, function(_index) { return string(_index) })];
option[2, 4] = "Back";

// Audio Menu

option[3, 0] = ["Master Volume: ", global.settings_master_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[3, 1] = ["Music Volume: ", global.settings_music_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[3, 2] = ["Effects Volume: ", global.settings_effects_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[3, 3] = "Back";

// Controls

option[4, 0] = ["Move Up: ", 0, [key_translate(global.settings_move_up)]];
option[4, 1] = ["Move Down: ", 0, [key_translate(global.settings_move_down)]];
option[4, 2] = ["Move Left: ", 0, [key_translate(global.settings_move_left)]];
option[4, 3] = ["Move Right: ", 0, [key_translate(global.settings_move_right)]];
option[4, 4] = ["Sprint: ", 0, [key_translate(global.settings_sprint)]];
option[4, 5] = ["Interact: ", 0, [key_translate(global.settings_interact)]];
option[4, 6] = ["Open Inventory: ", 0, [key_translate(global.settings_open_inventory)]];
option[4, 7] = ["Open Settings: ", 0, [key_translate(global.settings_open_settings)]];
option[4, 8] = ["Skip Dialogue: ", 0, [key_translate(global.settings_skip_dialogue)]];
option[4, 9] = "Back";

op_length = 0;
menu_level = 0;