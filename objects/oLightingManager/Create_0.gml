//Vertex format and buffer setup
vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//Shader uniform variable setup
u_pos = shader_get_uniform(shLighting,"u_pos");
u_pos2 = shader_get_uniform(shShadow,"u_pos");
u_a = shader_get_uniform(shShadow,"u_alpha");

shaderSurface = noone;

/*
//Vertex format and buffer setup
//surface_resize(application_surface,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))

vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//Shader uniform variable setup
u_pos = shader_get_uniform(sLighting,"u_pos");
u_pos2 = shader_get_uniform(sShadow,"u_pos");
//u_z = shader_get_uniform(sLighting,"u_z");
//u_z2 = shader_get_uniform(sShadow,"u_z");
u_a = shader_get_uniform(sShadow,"u_alpha")

shaderSurface = noone;
//shaderSurface = surface_create(room_width,room_height);
*/