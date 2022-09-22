// --- ENVIRONMENT VARIABLES --- /

#macro PATHOBJ "objfiles/" // Folder path in Included Files for obj files
#macro PATHMTL "objfiles/" // Folder path in Included Files for mtl files
#macro PATHBIN "objbins/"  // Folder path in Included Files for exported vertex buffer binaries

// --- 3D INITIALIZATION --- /

/// @function init_3d()
function init_3d(){
	/// @desc Enables the 3D environment
	/// Create global vertex format for submitting buffers

	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	
	globalvar vformat;
	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_normal();
	vertex_format_add_texcoord();
	vertex_format_add_color();
	vformat = vertex_format_end();
}

// --- ENVIRONMENT FUNCTIONS --- /

/// @function obj_get_path
/// @arg objname {string} - Name of .obj model name
/// @desc Returns filepath for obj file based on PATHOBJ Macro
///		  and string in objname
function obj_get_path(objname){
	var str_out = string(PATHOBJ) + string(objname) + ".obj"
	return str_out;
}

/// @function mtl_get_path
/// @arg objname {string} - Name of .obj model name
/// @desc Returns filepath for mtl file based on PATHOBJ Macro
///		  and string in objname
function mtl_get_path(objname){
	var str_out = string(PATHMTL) + string(objname) + ".mtl"
	return str_out;
}

// --- CONSTRUCTORS --- /

/// @function model3d
/// @arg object_name {string} - Filename of .obj model
/// @arg texture_source {resource} - Sprite used as texture
/// @arg use_mtl {bool} - Choose to include .mtl file during .obj import
function model3d(object_name, texture_source, use_mtl) constructor {
	/// @desc Used for creating 3D Models to be used in Objects
	
	var t = get_timer();
	if(use_mtl) var _mtl = mtl_get_path(object_name);
	else var _mtl = -1;
	
	// If the vbuff file already exists in the included files, import that file
	// for vertex data instead, as parsing the obj file takes WAY longer
	if(file_exists(string(PATHBIN) + object_name + ".vbuff")){
		var vbuff_data = buffer_load(PATHBIN + object_name + ".vbuff");
		mesh = vertex_create_buffer_from_buffer(vbuff_data, vformat);
		buffer_delete(vbuff_data)
	} else {
		mesh = import_obj(object_name, _mtl, vformat);
	}
	objname = object_name;
	texture = texture_source;
	
	show_debug_message("Loading Object: '" + string(object_name) + "' took " + string((get_timer() - t) / 1000) + " milliseconds");
}

/// @function transform3d
/// @arg x {real} - X Position
/// @arg y {real} - Y Position
/// @arg z {real} - Z Position
/// @arg rotation_x {real} - X Rotation (Degrees)
/// @arg rotation_y {real} - Y Rotation (Degrees)
/// @arg rotation_z {real} - Z Rotation (Degrees)
/// @arg scale_x {real} - X Scale
/// @arg scale_y {real} - Y Scale
/// @arg scale_z {real} - Z Scale
function transform3d(xx, yy, zz, rx, ry, rz, sx, sy, sz) constructor {
	/// @desc Used with model3d() for creating 3D model transform data
	
	pos = { x : xx, y : yy, z : zz }
	rot = { x : rx, y : ry, z : rz }
	scale = { x : sx, y : sy, z : sz }
}

// --- 3D MOVEMENT APPLY --- /

/// @function apply_transform
/// @desc Submit Vertex Buffer for Model
///	Apply transformation matrix for Position, Rotation and Scale
function apply_transform(_mesh, _texture){
	if(FogEnabled) shader_set(sh_MainShader);
	if(_texture != -1) var tex = sprite_get_texture(_texture, 0);
	else var tex = -1;
	
	var mat = matrix_build(transform.pos.x, transform.pos.y, transform.pos.z,
						   transform.rot.x, transform.rot.y, transform.rot.z,
						   transform.scale.x, transform.scale.y, transform.scale.z);
	matrix_set(matrix_world, mat);
	vertex_submit(_mesh, pr_trianglelist, tex);
	matrix_world_reset();
	shader_reset();
}

/// @function matrix_world_reset
/// @desc Reset world matrix
function matrix_world_reset(){
	matrix_set(matrix_world, matrix_build_identity());
}