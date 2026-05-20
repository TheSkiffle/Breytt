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
width = max(width, min_width);
height = max(height, min_height);

draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Options

for (var _i = 0; _i < op_length; _i++) {
	var _c = c_white;
	if (pos == _i) { _c = c_yellow };
	if (is_array(option[menu_level, _i])) {
		draw_text_transformed_colour(x + op_border * scale, y + op_border * scale + op_space * _i * scale, 
			option[menu_level, _i][0] + option[menu_level, _i][2][option[menu_level, _i][1]], 
			scale, scale, 0,
			_c, _c, _c, _c, 1);
	} else {
		draw_text_transformed_colour(x + op_border * scale, y + op_border * scale + op_space * _i * scale, 
			option[menu_level, _i], 
			scale, scale, 0,
			_c, _c, _c, _c, 1);
	}
}