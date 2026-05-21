// Darken Background

draw_set_alpha(0.5);
draw_set_colour(c_black);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

// Draw Menu

draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if (key_already_used) {
	height = 170;
}
draw_sprite_ext(sprite_index, image_index, x - width / 2, y - height / 2, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Text

draw_text_transformed_colour(x + op_border * scale - width / 2, y + op_border * scale - height / 2, 
	"Press Any Key!", 
	scale, scale, 0,
	c_white, c_white, c_white, c_white, 1);
if (key_already_used) {
	draw_text_transformed_colour(x + op_border * scale - width / 2, y + op_border * scale - height / 2 + op_space * scale, 
		"Key In Use", 
		scale, scale, 0,
		c_white, c_white, c_white, c_white, 1);
}