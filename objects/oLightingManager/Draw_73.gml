//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _vb = vb;
var _ydiff = ydiff;
var _uWDpixelDims = uWDpixelDims
var _uniUV = uniUV;

if(!surface_exists(shaderSurface))
	shaderSurface = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

//draw_clear_alpha(c_white,1)//
surface_set_target(shaderSurface)
draw_clear_alpha(c_black,0)

//solve two problems; 
//one, drawing shadows (hopefully offset on top of player)
//two, having no shadows if there is open area present already

with(oLightPar){
	var _y = y
	
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_zero)
    shader_set(shShadow);
    shader_set_uniform_f(_u_pos2,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
    vertex_submit(_vb,pr_trianglelist,-1);
	
	gpu_set_blendmode(bm_subtract)
	shader_set(shDrawShape);
	with(oSolidPar) {
		//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_zero,bm_one,bm_zero)
		
		shader_set_uniform_f(_ydiff,y-_y);
		draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
	}
	//shader_reset()
	
	//gpu_set_blendmode_ext_sepalpha();
	shader_set(shPlayerLighting);
	//shader_set_uniform_f(_ptexlw,y-_y);
	var WDtexelW = texture_get_texel_width(sprite_get_texture(oPlayer.sprite_index,oPlayer.image_index))
	var WDtexelH = texture_get_texel_height(sprite_get_texture(oPlayer.sprite_index,oPlayer.image_index))
	var uvs = sprite_get_uvs(oPlayer.sprite_index,oPlayer.image_index)
	
	shader_set_uniform_f(_uWDpixelDims,WDtexelW,WDtexelH)
	shader_set_uniform_f(_uniUV, uvs[0], uvs[1], uvs[2], uvs[3]);
	//gpu_set_blendmode_ext_sepalpha(bm_one,bm_one,bm_zero,bm_zero);
	//gpu_set_blendmode(bm_subtract)
	//draw_sprite_ext(oPlayer.sprite_index,oPlayer.image_index,oPlayer.x-camera_get_view_x(view_camera[0]),oPlayer.y-camera_get_view_y(view_camera[0]),1,1,0,c_black,0)
	draw_sprite(oPlayer.sprite_index,oPlayer.image_index,oPlayer.x-camera_get_view_x(view_camera[0]),oPlayer.y-camera_get_view_y(view_camera[0]))
	shader_reset()
	gpu_set_blendmode(bm_normal);
	
//}
//with(oLightPar){
    gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
    shader_set(shLighting);
    shader_set_uniform_f(_u_pos,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
	var color = c_purple; //make_color_rgb(lightcolorr,lightcolorb,lightcolorg);
    draw_rectangle_color(0,0,camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]),color,color,color,color,0); //canvas for drawing the light
    gpu_set_blendmode(bm_normal);
	//gpu_set_depth(0)

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
	c_purple,
	clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY)))
)
shader_reset();
gpu_set_blendmode(bm_normal)