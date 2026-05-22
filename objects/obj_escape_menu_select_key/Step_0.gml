// Perform Key Selection

if (keyboard_check_pressed(vk_anykey)) {
	if (is_key_used(keyboard_key, key_ref)) {
		key_already_used = true;
	} else {
		key_pressed = true;
		apply_key_binding(keyboard_key, key_ref, obj_escape_menu);
	}
}

// Ensure Keys Are Clean

if (key_pressed && !keyboard_check_pressed(vk_anykey)) {
	obj_escape_menu.menu_frozen = false;
	instance_destroy();
}