/// @function vertex_add_point
/// @param buffer		Vertex Buffer to add point to
/// @param xx			X value of Position
/// @param yy			Y value of Position
/// @param zz			Z value of Position
/// @param nx			X direction of Normal
/// @param ny			Y direction of Normal
/// @param nz			Z direction of Normal
/// @param utex			U value of Texcoord (Between 0 and 1)
/// @param vtex			V value of Texcoord (Between 0 and 1)
function vertex_add_point(buffer, xx, yy, zz, nx, ny, nz, utex, vtex, col, alph){
	/// @desc Adds a single Vertex in 3D Space
	
	vertex_position_3d(buffer, xx, yy, zz);
	vertex_normal(buffer, nx, ny, nz);
	vertex_texcoord(buffer, utex, vtex);
	vertex_color(buffer, col, alph);
}

/// @function draw_3d_cube
/// @param vbuf
/// @param xx X POS
/// @param yy Y POS
/// @param zz Z POS
/// @param ww Width (X)
/// @param ll Length (Z)
/// @param hh Height (Y)
/// @desc Adds Cube Primitive in 3D space
function draw_3d_cube(vbuf, xx, yy, zz, ww, ll, hh){
	var x1, x2, y1, y2, z1, z2, rw, rl, rh;
	var c1 = make_color_rgb(255, 255, 255);
	var c2 = make_color_rgb(191, 191, 191);
	var c3 = make_color_rgb(127, 127, 127);
	
	rw = ww / 2;
	rl = ll / 2;
	rh = hh / 2;
	
	x1 = xx - rw;
	y1 = yy - rh;
	z1 = zz - rl;
	x2 = xx + rw;
	y2 = yy + rh;
	z2 = zz + rl;
	
	// FRONT
	vertex_add_point(vbuf, x1, y1, z1,		1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x1, y2, z1,		1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x2, y2, z1,		1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x2, y2, z1,		1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x2, y1, z1,		1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x1, y1, z1,		1, 0, 0,		0, 0,		c1, 1);
	
	// LEFT
	vertex_add_point(vbuf, x1, y1, z2,		0, 0, -1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x1, y2, z2,		0, 0, -1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x1, y2, z1,		0, 0, -1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x1, y2, z1,		0, 0, -1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x1, y1, z1,		0, 0, -1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x1, y1, z2,		0, 0, -1,		0, 0,		c2, 1);
																		
	// BACK																
	vertex_add_point(vbuf, x2, y1, z2,		-1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x2, y2, z2,		-1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x1, y2, z2,		-1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x1, y2, z2,		-1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x1, y1, z2,		-1, 0, 0,		0, 0,		c1, 1);
	vertex_add_point(vbuf, x2, y1, z2,		-1, 0, 0,		0, 0,		c1, 1);
																		
	// RIGHT															
	vertex_add_point(vbuf, x2, y1, z1,		0, 0, 1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x2, y2, z1,		0, 0, 1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x2, y2, z2,		0, 0, 1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x2, y2, z2,		0, 0, 1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x2, y1, z2,		0, 0, 1,		0, 0,		c2, 1);
	vertex_add_point(vbuf, x2, y1, z1,		0, 0, 1,		0, 0,		c2, 1);
											
	// TOP									
	vertex_add_point(vbuf, x1, y2, z1,		0, 1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x1, y2, z2,		0, 1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y2, z2,		0, 1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y2, z2,		0, 1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y2, z1,		0, 1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x1, y2, z1,		0, 1, 0,		0, 0,		c3, 1);
	
	// BOTTOM
	vertex_add_point(vbuf, x1, y1, z2,		0, -1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x1, y1, z1,		0, -1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y1, z1,		0, -1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y1, z1,		0, -1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x2, y1, z2,		0, -1, 0,		0, 0,		c3, 1);
	vertex_add_point(vbuf, x1, y1, z2,		0, -1, 0,		0, 0,		c3, 1);
}

/// @function world_to_screen
/// @arg xx - X Position
/// @arg yy - Y Position
/// @arg zz - Z Position
/// @arg view_mat - View Matrix of Active Camera
/// @arg proj_mat - Projection Matrix of Active Camera
function world_to_screen(xx, yy, zz, view_mat, proj_mat){

	/// @desc Transforms a 3D world-space coordinate to a 2D window-space coordinate.
	///		  Returns an array of the following format: [xx, yy]
	///		  Returns [-1, -1] if the 3D point is not in view

	if (proj_mat[15] == 0) { // If using perspective projection
	    var w = view_mat[2] * xx + view_mat[6] * yy + view_mat[10] * zz + view_mat[14];
	    if (w <= 0) return [-1, -1];
	    var cx = proj_mat[8] + proj_mat[0] * (view_mat[0] * xx + view_mat[4] * yy + view_mat[8] * zz + view_mat[12]) / w;
	    var cy = proj_mat[9] + proj_mat[5] * (view_mat[1] * xx + view_mat[5] * yy + view_mat[9] * zz + view_mat[13]) / w;
	} else { // If using orthographic projection
	    var cx = proj_mat[12] + proj_mat[0] * (view_mat[0] * xx + view_mat[4] * yy + view_mat[8]  * zz + view_mat[12]);
	    var cy = proj_mat[13] + proj_mat[5] * (view_mat[1] * xx + view_mat[5] * yy + view_mat[9]  * zz + view_mat[13]);
	}

	return [(0.5 + 0.5 * cx) * display_get_gui_width(), (0.5 - 0.5 * cy) * display_get_gui_height()];
}

/// @function draw_text_billboard
/// @arg xx  - X Position in World Space
/// @arg yy  - Y Position in World Space
/// @arg zz  - Z Position in World Space
/// @arg fnt - Font used for text
/// @arg col - Color of text
/// @arg txt - Text to be drawn
function draw_text_billboard(xx, yy, zz, fnt, col, txt) {
	
	/// @desc Writes text to screen-space based on provided world-space coordinated
	/// To be used in the Draw GUI Event
	
	var name_pos = world_to_screen(xx, yy, zz,
							camera_get_view_mat(Camera3D), camera_get_proj_mat(Camera3D));

	draw_reset();
	draw_set_text(fa_center, fa_center, fnt, col);
	draw_text(name_pos[0], name_pos[1], txt);
}