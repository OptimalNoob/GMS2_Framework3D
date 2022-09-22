/// @desc

mouseFree = keyboard_check(vk_alt);
if(keyboard_check_released(vk_alt)) display_mouse_set(display_get_width() / 2, display_get_height() / 2);
if(keyboard_check_pressed(vk_f1)) DebugMode = !DebugMode;
if(keyboard_check_pressed(ord("F"))) FogEnabled = !FogEnabled;
if(keyboard_check_pressed(vk_f11)) window_set_fullscreen(!window_get_fullscreen());

if(keyboard_check_direct(vk_escape)){
    game_end();
}

if(!mouseFree){
	window_set_cursor(cr_none);
	transform.rot.y -= (display_mouse_get_x() - display_get_width() / 2) / 20;
	if(transform.rot.y > 360) transform.rot.y -= 360;
	if(transform.rot.y < 0) transform.rot.y += 360
	transform.rot.x = clamp(transform.rot.x - (display_mouse_get_y() - display_get_height() / 2) / 20, -85, 85);
	display_mouse_set(display_get_width() / 2, display_get_height() / 2);
} else {
	window_set_cursor(cr_arrow);
}

if (keyboard_check(ord("W"))){
	transform.pos.z -= dsin(transform.rot.y) * moveSpeed;
	transform.pos.x -= dcos(transform.rot.y) * moveSpeed;
}

if (keyboard_check(ord("S"))){
	transform.pos.z += dsin(transform.rot.y) * moveSpeed;
	transform.pos.x += dcos(transform.rot.y) * moveSpeed;
}

if (keyboard_check(ord("A"))){
	transform.pos.z -= dcos(transform.rot.y) * moveSpeed;
	transform.pos.x += dsin(transform.rot.y) * moveSpeed;
}

if (keyboard_check(ord("D"))){
	transform.pos.z += dcos(transform.rot.y) * moveSpeed;
	transform.pos.x -= dsin(transform.rot.y) * moveSpeed;
}

if(keyboard_check(vk_space)) transform.pos.y -= moveSpeed;
if(keyboard_check(vk_shift)) transform.pos.y += moveSpeed;