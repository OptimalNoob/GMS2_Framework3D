/// @desc

gpu_set_cullmode(cull_noculling);
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(4, display_get_gui_height() - 4, 1088, display_get_gui_height() - 32, false);
draw_reset();
draw_set_valign(fa_bottom)
draw_text(8, display_get_gui_height() - 8, "Esc - Quit   F1 - Debug Mode   F11 - Toggle Fullscreen   Alt (hold) - Unlock Mouse   F - Toggle Fog");

if(DebugMode){
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(4, 4, 320, 102, false);
	draw_reset();
	
	//var cardDir = floor(((transform.rot.y div 45) + 1) * 0.5);
	var cardDir = round(transform.rot.y / 90);
	var cardLet = "";
	switch(cardDir){
		case 0: case 4: cardLet = "W"; break;
		case 1: cardLet = "S"; break;
		case 2: cardLet = "E"; break;
		case 3: cardLet = "N"; break;
		default: break;
	}
	
	draw_set_font(fntSystem);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(8, 8, "Position:");
	draw_text(8, 32, "X: " + string(transform.pos.x) + ", Y: " + string(transform.pos.y) + ", Z: " + string(transform.pos.z));
	draw_text(8, 56, "Looking:");
	draw_text(8, 80, "Dir: " + string(transform.rot.y) + " (" + string(cardLet) + ")" + ", Pitch: " + string(transform.rot.x));
	draw_set_halign(fa_right);
	draw_text(display_get_gui_width() - 8, 8, "FPS: " + string(fps_real));
}
gpu_set_cullmode(cull_clockwise);