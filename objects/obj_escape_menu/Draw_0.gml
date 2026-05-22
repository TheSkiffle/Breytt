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
	var _sel_item = option[menu_level, _i];
	if (is_array(_sel_item)) {
		var _op_w = string_width(_sel_item[0]
			+ _sel_item[2][_sel_item[1]]);
		_new_w = max(_new_w, _op_w);
	} else {
		var _op_w = string_width(_sel_item);
		_new_w = max(_new_w, _op_w);
	}
}
width = (op_border * 2 + _new_w) * scale;
height = (op_border * 2 + string_height(option[0, 0]) + (op_length - 1) * op_space) * scale;
width = min(max(width, min_width), max_width);
height = min(max(height, min_height), max_height);

draw_sprite_ext(sprite_index, 
	image_index, 
	cam_x + gui_width / 2 - width / 2, 
	cam_y + gui_height / 2 - height / 2, 
	width/sprite_width, 
	height/sprite_height, 
	0, 
	c_white, 
	1
);

// Draw Options

if (y + (op_border + op_space * (pos + scroll) + string_height(option[0, 0])) * scale > y + height) { scroll-- };
if (y + (op_border + op_space * (pos + scroll)) * scale < y) { scroll++ };

gpu_set_scissor(gui_width / 2 - width / 2, gui_height / 2 - height / 2, width, height);
for (var _i = 0; _i < op_length; _i++) {
	var _xpos = x + op_border * scale - width / 2;
	var _ypos = y + op_border * scale + op_space * (_i + scroll) * scale - height / 2;
	var _sel_item = option[menu_level, _i];
	var _c = c_white;
	if (pos == _i) { _c = c_yellow };
	draw_text_transformed_colour(
		_xpos, _ypos,
		(is_array(_sel_item) ? _sel_item[0] + _sel_item[2][_sel_item[1]] : _sel_item),
		scale, scale, 0,
		_c, _c, _c, _c, 1
	);
}
gpu_set_scissor(0, 0, gui_width, gui_height);