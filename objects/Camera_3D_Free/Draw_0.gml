if(FogEnabled) shader_set(sh_MainShader);

view_mat = matrix_build_lookat(transform.pos.x, transform.pos.y, transform.pos.z,
							transform.pos.x - dcos(transform.rot.y) * dcos(transform.rot.x),
							transform.pos.y - dsin(transform.rot.x),
							transform.pos.z - dsin(transform.rot.y) * dcos(transform.rot.x),
							0, 1, 0);
proj_mat = matrix_build_projection_perspective_fov(60, window_get_width() / window_get_height(), 1, 32000);
camera_set_view_mat(Camera3D, view_mat);
camera_set_proj_mat(Camera3D, proj_mat);
camera_apply(Camera3D);

shader_reset();
gpu_set_zwriteenable(false);
matrix_set(matrix_world, matrix_build(transform.pos.x, transform.pos.y, transform.pos.z, 0, 0, 0, 5, 5, 5));
vertex_submit(skybox.mesh, pr_trianglelist, sprite_get_texture(skybox.texture, 0));
matrix_world_reset();
gpu_set_zwriteenable(true);

if(FogEnabled) shader_set(sh_MainShader);
test_ground = vertex_create_buffer();
vertex_begin(test_ground, vformat);
draw_3d_cube(test_ground, 0, 0, 0, 10, 10, 0.5);
vertex_end(test_ground);
vertex_submit(test_ground, pr_trianglelist, -1);
shader_reset();
