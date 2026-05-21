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