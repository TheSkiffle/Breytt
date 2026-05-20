function key_translate(_key) {
	switch (_key) {
		case vk_up: return "Up Arrow";
		case vk_down: return "Down Arrow";
		case vk_left: return "Left Arrow";
		case vk_right: return "Right Arrow";
		case vk_space: return "Space";
		case vk_enter: return "Enter";
		case vk_shift: return "Shift";
		case vk_control: return "Control";
		case vk_tab: return "Tab";
		case vk_alt: return "Alt";
		case vk_backspace: return "Backspace";
		case vk_escape: return "Escape";
		default:
			if (_key >= 48 && _key <= 90) return chr(_key);
			return "Key " + string(_key);
	}
}