if(!surface_exists(shaderSurfaceTop))
	shaderSurfaceTop = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

if(!surface_exists(shaderSurfaceBelow))
	shaderSurfaceBelow = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)
	
if(!surface_exists(shaderSurfaceGeneral))
	shaderSurfaceGeneral = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _u_flicker = u_flicker
var _vb = vb;
var _ydiff = ydiff;
var _uWDpixelDims = uWDpixelDims
var _uniUV = uniUV;
var _shaderSurfaceTop = shaderSurfaceTop;
var _shaderSurfaceBelow = shaderSurfaceBelow;
var _shaderSurfaceGeneral = shaderSurfaceGeneral;

surface_set_target(_shaderSurfaceTop)
draw_clear_alpha(c_black,0)
surface_reset_target()

surface_set_target(_shaderSurfaceBelow)
draw_clear_alpha(c_white,0)
surface_reset_target()

surface_set_target(_shaderSurfaceGeneral)
draw_clear_alpha(c_black,0)
surface_reset_target()

with(oLightPar){
	if(point_distance(x,y,oPlayer.x,oPlayer.y)<320) {
		var _y = y
		
		/*
		surface_set_target(_shaderSurfaceTop)
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_zero)
	    shader_set(shShadow);
	    shader_set_uniform_f(_u_pos2,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
	    vertex_submit(_vb,pr_trianglelist,-1);
		surface_reset_target()
		*/
		
		surface_set_target(_shaderSurfaceGeneral)
		gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_zero)
	    shader_set(shShadow);
	    shader_set_uniform_f(_u_pos2,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
		vertex_submit(_vb,pr_trianglelist,-1);
		surface_reset_target()
	
	
		shader_set(shDrawShape);
		with(oSolidPar) {
			surface_set_target(_shaderSurfaceGeneral)
			shader_set_uniform_f(_ydiff,y-_y);
			
			if(y-_y<=0) {
				gpu_set_blendmode(bm_subtract)
			} else {
				gpu_set_blendmode(bm_add)
			}
			draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
			surface_reset_target()
		}
		shader_reset()
		
		surface_set_target(_shaderSurfaceGeneral)
	    gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
	    shader_set(shLighting);
	    shader_set_uniform_f(_u_pos,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
		shader_set_uniform_f(_u_flicker, flickerstr);
	    draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),lightcolor,lightcolor,lightcolor,lightcolor,0); //canvas for drawing the light
	    gpu_set_blendmode(bm_normal);
		shader_reset()
		surface_reset_target()
		
		/*
		surface_set_target(_shaderSurfaceTop)
	    gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
	    shader_set(shLighting);
	    shader_set_uniform_f(_u_pos,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
		shader_set_uniform_f(_u_flicker, flickerstr);
	    draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),lightcolor,lightcolor,lightcolor,lightcolor,0); //canvas for drawing the light
	    gpu_set_blendmode(bm_normal);
		shader_reset()
		surface_reset_target()
		*/
	}
}

/*
surface_copy_part(_shaderSurfaceBelow,0,0,
	_shaderSurfaceTop,
	0,0,
	camera_get_view_width(view_camera[0]),
	(oPlayer.y-camera_get_view_y(view_camera[0]))+1
);
*/

//oTopSurface.shaderSurface = _shaderSurfaceTop;
oBottomSurface.shaderSurface = _shaderSurfaceBelow;

gpu_set_blendmode_ext(bm_zero,bm_src_color)
shader_set(shShadSurf)
depth = oPlayer.depth-1000000;
draw_surface_ext(shaderSurfaceGeneral,
	camera_get_view_x(view_camera[0]),
	camera_get_view_y(view_camera[0]),
	1,
	1,
	0,
	c_black,
	clamp(-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY)),0,.5)+0.125
)
shader_reset();
gpu_set_blendmode(bm_normal)
