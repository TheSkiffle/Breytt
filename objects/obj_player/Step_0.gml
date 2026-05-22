// Handle Inputs

right_key = keyboard_check(global.settings_move_right);
left_key = keyboard_check(global.settings_move_left);
up_key = keyboard_check(global.settings_move_up);
down_key = keyboard_check(global.settings_move_down);
sprint_key = keyboard_check(global.settings_sprint);
open_settings_key = keyboard_check_pressed(global.settings_open_settings);

if (open_settings_key && settings_opened == false && !global.mid_transition) {
	var cam_x = camera_get_view_x(view_camera[0]);
	var cam_y = camera_get_view_y(view_camera[0]);
	instance_create_depth(cam_x + display_get_gui_width() / 2, cam_y + display_get_gui_height() / 2, -9998, obj_escape_menu);
	global.paused = true;
	settings_opened = true;
}

// Movement Calculation

xunit = right_key - left_key;
yunit = down_key - up_key;

if (global.paused) {
	xunit = 0;
	yunit = 0;
}

magnitude = sqrt(sqr(xunit) + sqr(yunit));
normalized_xunit = xunit / sqrt((magnitude != 0) ? magnitude : 1);
normalized_yunit = yunit / sqrt((magnitude != 0) ? magnitude : 1);

if (sprint_key) {
	xspd = normalized_xunit * sprint_spd;
	yspd = normalized_yunit * sprint_spd;
	image_speed = sprint_anim_spd;
} else {
	xspd = normalized_xunit * move_spd;
	yspd = normalized_yunit * move_spd;
	image_speed = anim_spd;
}

// Collision Resolution

if (place_meeting(x + xspd, y, obj_wall)) {
	xspd = 0;
}
if (place_meeting(x, y + yspd, obj_wall)) {
	yspd = 0;
}
if (place_meeting(x + xspd, y + yspd, obj_wall)) {
	xspd = 0;
	yspd = 0;
}

// Movement Execution

obj_player.x += xspd;
obj_player.y += yspd;

// Sprite Calculation

mask_index = sprite[DOWN];

if (yunit == 0) {
	if xunit > 0 {face = RIGHT} else
	if xunit < 0 {face = LEFT}
}
if (xunit > 0 && face == LEFT) {face = RIGHT}
if (xunit < 0 && face == RIGHT) {face = LEFT}
if (xunit == 0) {
	if yunit > 0 {face = DOWN} else
	if yunit < 0 {face = UP}
}
if (yunit > 0 && face == UP) {face = DOWN}
if (yunit < 0 && face == DOWN) {face = UP}

sprite_index = sprite[face];

if (xunit == 0 && yunit == 0) {
	image_index = 0;
}

depth = -bbox_bottom;