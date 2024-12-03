application_surface_draw_enable(false);

//surface_resize(application_surface,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))

//Vertex format and buffer setup
vertex_format_begin();
vertex_format_add_position_3d();
vf = vertex_format_end();
vb = vertex_create_buffer();

//Shader uniform variable setup
u_pos = shader_get_uniform(shLighting,"u_pos");
u_pos2 = shader_get_uniform(shShadow,"u_pos");

drawShadow = shader_get_uniform(shDrawShape,"drawShadow");
subtractOn = shader_get_uniform(shDrawShape, "subtractOn");

uWDpixelDims =  shader_get_uniform(shPlayerLighting, "uWDpixelDims");
uniUV =  shader_get_uniform(shPlayerLighting, "uniUV");

shaderSurface = noone;