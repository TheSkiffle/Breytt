// Darken Background

draw_set_alpha(0.5);
draw_set_colour(c_black);
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);
var gui_width = display_get_gui_width();
var gui_height = display_get_gui_height();
draw_rectangle(cam_x, cam_y, cam_x + gui_width, cam_y + gui_height, false);
draw_set_alpha(1);

// Draw Menu

draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

var _new_w = 0;
for (var _i = 0; _i < op_length; _i++) {
	if (is_array(option[menu_level, _i])) {
		var _op_w = string_width(option[menu_level, _i][0]
			+ option[menu_level, _i][2][option[menu_level, _i][1]]);
		_new_w = max(_new_w, _op_w);
	} else {
		var _op_w = string_width(option[menu_level, _i]);
		_new_w = max(_new_w, _op_w);
	}
}
width = (op_border * 2 + _new_w) * scale;
height = (op_border * 2 + string_height(option[0, 0]) + (op_length - 1) * op_space) * scale;
width = min(max(width, min_width), max_width);
height = min(max(height, min_height), max_height);

draw_sprite_ext(sprite_index, image_index, cam_x + gui_width / 2 - width / 2, cam_y + gui_height / 2 - height / 2, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Options

if (y + op_border * scale + op_space * (pos + scroll) * scale + string_height(option[0, 0]) * scale > y + height) { scroll-- };
if (y + op_border * scale + op_space * (pos + scroll) * scale < y) { scroll++ };

gpu_set_scissor(gui_width / 2 - width / 2, gui_height / 2 - height / 2, width, height);
for (var _i = 0; _i < op_length; _i++) {
	var _c = c_white;
	if (pos == _i) { _c = c_yellow };
	if (is_array(option[menu_level, _i])) {
		draw_text_transformed_colour(x + op_border * scale - width / 2, y + op_border * scale + op_space * (_i + scroll) * scale - height / 2, 
			option[menu_level, _i][0] + option[menu_level, _i][2][option[menu_level, _i][1]], 
			scale, scale, 0,
			_c, _c, _c, _c, 1);
	} else {
		draw_text_transformed_colour(x + op_border * scale - width / 2, y + op_border * scale + op_space * (_i + scroll) * scale - height / 2, 
			option[menu_level, _i], 
			scale, scale, 0,
			_c, _c, _c, _c, 1);
	}
}
gpu_set_scissor(0, 0, window_get_width(), window_get_height());