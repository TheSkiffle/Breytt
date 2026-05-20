// Movement Calculation

right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

xunit = right_key - left_key;
yunit = down_key - up_key;

if (global.paused) {
	xunit = 0;
	yunit = 0;
}

magnitude = sqrt(sqr(xunit) + sqr(yunit));
normalized_xunit = xunit / sqrt((magnitude != 0) ? magnitude : 1);
normalized_yunit = yunit / sqrt((magnitude != 0) ? magnitude : 1);

xspd = normalized_xunit * move_spd;
yspd = normalized_yunit * move_spd;

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