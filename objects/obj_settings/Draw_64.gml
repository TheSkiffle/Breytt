// Draw Brightness Overlay

if (global.settings_brightness < 100) {
	draw_set_alpha((1 - global.settings_brightness / 100) / brightness_reduc_factor);
	draw_set_color(c_black);
} else {
	draw_set_alpha((global.settings_brightness - 100) / (100 * brightness_reduc_factor));
	draw_set_color(c_white);
}
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1.0);