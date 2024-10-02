//Vertex format and buffer setup
vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//Shader uniform variable setup
u_pos = shader_get_uniform(sLighting,"u_pos");
u_pos2 = shader_get_uniform(sShadow,"u_pos");
u_z = shader_get_uniform(sLighting,"u_z");
u_z2 = shader_get_uniform(sShadow,"u_z");