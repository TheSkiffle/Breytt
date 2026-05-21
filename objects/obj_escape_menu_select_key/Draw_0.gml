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

if (key_already_used) {
	height = 170;
}
draw_sprite_ext(sprite_index, image_index, cam_x + gui_width / 2 - width / 2, cam_y + gui_height / 2 - height / 2, width/sprite_width, height/sprite_height, 0, c_white, 1);

// Draw Text

draw_text_transformed_colour(cam_x + gui_width / 2 + op_border * scale - width / 2, cam_y + gui_height / 2 + op_border * scale - height / 2, 
	"Press Any Key!", 
	scale, scale, 0,
	c_white, c_white, c_white, c_white, 1);
if (key_already_used) {
	draw_text_transformed_colour(cam_x + gui_width / 2 + op_border * scale - width / 2, cam_y + gui_height / 2 + op_border * scale - height / 2 + op_space * scale, 
		"Key In Use", 
		scale, scale, 0,
		c_white, c_white, c_white, c_white, 1);
}