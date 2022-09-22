/// @function draw_name
/// @arg xx {real} - X POS of Text
/// @arg yy {real} - Y POS of Text
/// @desc - Draw text above 3D object
function draw_name(xx, yy, txt){
	draw_set_text(fa_center, fa_bottom, fntSystem, c_white);
	draw_text_transformed(xx, yy, txt, 0.05, 0.05, 0);
	draw_reset();
}

/// @function draw_set_text
/// @arg ha - Horizontal Alignment
/// @arg va - Vertical Alignment
/// @arg fnt - Font
/// @arg col - Color
/// @desc - Abstracted draw properties function
function draw_set_text(ha, va, fnt, col){
	draw_set_alpha(1);
	draw_set_halign(ha);
	draw_set_valign(va);
	draw_set_color(col);
	draw_set_font(fnt);
}

/// @function draw_reset
/// @desc - Reset draw properties
function draw_reset(){
	draw_set_font(fntSystem);
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(1);
}