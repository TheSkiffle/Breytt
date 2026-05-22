global.control_to_setting[CON_MOVE_UP] = "settings_move_up";
global.control_to_setting[CON_MOVE_DOWN] = "settings_move_down";
global.control_to_setting[CON_MOVE_LEFT] = "settings_move_left";
global.control_to_setting[CON_MOVE_RIGHT] = "settings_move_right";
global.control_to_setting[CON_SPRINT] = "settings_sprint";
global.control_to_setting[CON_INTERACT] = "settings_interact";
global.control_to_setting[CON_OPEN_INVENTORY] = "settings_open_inventory";
global.control_to_setting[CON_OPEN_SETTINGS] = "settings_open_settings";
global.control_to_setting[CON_SKIP_DIALOGUE] = "settings_SKIP_DIALOGUE";

function key_translate(_key) {
	switch (_key) {
		case vk_up: return "Up Arrow";
		case vk_down: return "Down Arrow";
		case vk_left: return "Left Arrow";
		case vk_right: return "Right Arrow";
		case vk_space: return "Space";
		case vk_enter: return "Enter";
		case vk_shift: return "Shift";
		case vk_lcontrol: return "Left Control";
		case vk_rcontrol: return "Right Control";
		case vk_tab: return "Tab";
		case vk_lalt: return "Left Alt";
		case vk_ralt: return "Right Alt";
		case vk_backspace: return "Backspace";
		case vk_escape: return "Escape";
		case 192: return "~";
		case 189: return "-";
		case 187: return "=";
		case 219: return "[";
		case 221: return "]";
		case 220: return "\\";
		case 186: return ";";
		case 222: return "'";
		case 188: return ",";
		case 190: return ".";
		case 191: return "/";
		case 20: return "Caps Lock";
		default:
			if (_key >= 48 && _key <= 90) return chr(_key);
			return "Key " + string(_key);
	}
}

function open_key_select(_label, _menu_obj) {
	var _inst = instance_create_depth(
		display_get_gui_width() / 2, 
		display_get_gui_height() / 2, 
		-9999, 
		_menu_obj
	);
	
	_inst.key_ref = _label;
	menu_frozen = true;
	
	return _inst;
}

function is_key_used(_key, _exclude_control) {
	for (var _i = 0; _i < array_length(global.control_to_setting); _i++) {
		var _control = variable_global_get(global.control_to_setting[_i]);
		
		if (_control == variable_global_get(global.control_to_setting[_exclude_control])) continue;
		
		if (_key == _control) { return true; }
	}
	return false;
}

function apply_escape_key_binding(_key, _control) {
	variable_global_set(global.control_to_setting[_control], _key);
	obj_escape_menu.option[CONTROLS_MENU, _control][2] = [key_translate(_key)];
}