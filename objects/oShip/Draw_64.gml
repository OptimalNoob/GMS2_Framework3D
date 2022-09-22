gpu_set_cullmode(cull_noculling);
draw_text_billboard(transform.pos.x, transform.pos.y - 3, transform.pos.z, fntDefault, c_white, model.objname);
gpu_set_cullmode(cull_clockwise);