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

// Starting Menu

option[STARTING_MENU, START_START_GAME] = "Start Game";
option[STARTING_MENU, START_SETTINGS] = "Settings";
option[STARTING_MENU, START_QUIT_GAME] = "Quit Game";

// Settings Menu

option[SETTINGS_MENU, SET_GENERAL] = "General";
option[SETTINGS_MENU, SET_AUDIO] = "Audio";
option[SETTINGS_MENU, SET_CONTROLS] = "Controls";
option[SETTINGS_MENU, SET_BACK] = "Back";

// General Menu

option[GENERAL_MENU, GEN_WINDOW_MODE] = ["Window Mode: ", global.settings_window_mode, ["Windowed", "Windowed Borderless", "Fullscreen"]];
option[GENERAL_MENU, GEN_ANTIALIASING] = ["Anti-Aliasing: ", global.settings_antialiasing, ["Disabled", "2x (if supported)", "4x (if supported)", "8x (if supported)"]];
option[GENERAL_MENU, GEN_VSYNC] = ["Vertical Sync: ", global.settings_vertical_sync, ["Disabled", "Enabled"]];
option[GENERAL_MENU, GEN_BRIGHTNESS] = ["Brightness: ", global.settings_brightness, array_create_ext(201, function(_index) { return string(_index) })];
option[GENERAL_MENU, GEN_BACK] = "Back";

// Audio Menu

option[AUDIO_MENU, AUD_MASTER_VOL] = ["Master Volume: ", global.settings_master_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[AUDIO_MENU, AUD_MUSIC_VOL] = ["Music Volume: ", global.settings_music_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[AUDIO_MENU, AUD_EFFECTS_VOL] = ["Effects Volume: ", global.settings_effects_volume, array_create_ext(201, function(_index) { return string(_index) })];
option[AUDIO_MENU, AUD_BACK] = "Back";

// Controls

option[CONTROLS_MENU, CON_MOVE_UP] = ["Move Up: ", 0, [key_translate(global.settings_move_up)]];
option[CONTROLS_MENU, CON_MOVE_DOWN] = ["Move Down: ", 0, [key_translate(global.settings_move_down)]];
option[CONTROLS_MENU, CON_MOVE_LEFT] = ["Move Left: ", 0, [key_translate(global.settings_move_left)]];
option[CONTROLS_MENU, CON_MOVE_RIGHT] = ["Move Right: ", 0, [key_translate(global.settings_move_right)]];
option[CONTROLS_MENU, CON_SPRINT] = ["Sprint: ", 0, [key_translate(global.settings_sprint)]];
option[CONTROLS_MENU, CON_INTERACT] = ["Interact: ", 0, [key_translate(global.settings_interact)]];
option[CONTROLS_MENU, CON_OPEN_INVENTORY] = ["Open Inventory: ", 0, [key_translate(global.settings_open_inventory)]];
option[CONTROLS_MENU, CON_OPEN_SETTINGS] = ["Open Settings: ", 0, [key_translate(global.settings_open_settings)]];
option[CONTROLS_MENU, CON_SKIP_DIALOGUE] = ["Skip Dialogue: ", 0, [key_translate(global.settings_skip_dialogue)]];
option[CONTROLS_MENU, CON_BACK] = "Back";

op_length = 0;
menu_level = 0;