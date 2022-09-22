/// @function init_main()
/// @desc
function init_main(){
	init_globals();
	init_3d();
	init_camera();
	room_goto(rm_Debug01);
}


/// @function init_camera()
/// @desc
function init_camera(){
	globalvar Camera3D;
	Camera3D = camera_create();
}

/// @function init_globals()
/// @desc
function init_globals(){
	globalvar DebugMode;
	DebugMode = false;
	
	globalvar FogEnabled;
	FogEnabled = false;
}