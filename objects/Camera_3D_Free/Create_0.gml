gpu_set_cullmode(cull_clockwise);
transform = new transform3d(-5, -3, -5, -25, 225, 0, 1, 1, 1);
mouseFree = false;
moveSpeed = 0.1;

view_mat = undefined;
proj_mat = undefined;

display_mouse_set(display_get_width() / 2, display_get_height() / 2);
window_set_size(1920, 1080);
surface_resize(application_surface, 1920, 1080);
alarm[0] = 1;

skybox = new model3d("skybox", sb_Desert01, false);

// Testing
var _ship = instance_create_depth(0, 0, 0, oShip);
_ship.transform.pos.y = -5;