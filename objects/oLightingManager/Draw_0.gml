//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _vb = vb;
var _u_a = u_a;

if(!surface_exists(shaderSurface))
	shaderSurface = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

surface_set_target(shaderSurface)
draw_clear_alpha(c_black,0)
with(oLightPar){
	depth = -y
	
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_one)
    shader_set(shShadow);
    shader_set_uniform_f(_u_pos2,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
	
	shader_set_uniform_f(_u_a,clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY))))
    vertex_submit(_vb,pr_trianglelist,-1);

    //Draw the Light
    gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
    shader_set(shLighting);
    shader_set_uniform_f(_u_pos,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
	var color = c_purple; //make_color_rgb(lightcolorr,lightcolorb,lightcolorg);
    draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),color,color,color,color,0); //canvas for drawing the light
    gpu_set_blendmode(bm_normal);

}
shader_reset();
surface_reset_target()

gpu_set_blendmode_ext(bm_zero,bm_src_color)
shader_set(shShadSurf)
draw_surface_ext(shaderSurface,
	camera_get_view_x(view_camera[0]),
	camera_get_view_y(view_camera[0]),
	1,
	1,
	0,
	c_white,
	clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY)))
)
shader_reset();
gpu_set_blendmode(bm_normal)