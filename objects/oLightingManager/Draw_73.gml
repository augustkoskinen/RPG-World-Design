if(!surface_exists(shaderSurface))
	shaderSurface = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _vb = vb;
var _ydiff = ydiff;
var _uWDpixelDims = uWDpixelDims
var _uniUV = uniUV;
var _shaderSurface = shaderSurface;
var _subtractOn = subtractOn;

//draw_clear_alpha(c_white,1)//====================|
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
	
	shader_set(shDrawShape);
	with(oSolidPar) {
		surface_set_target(_shaderSurface)
		shader_set_uniform_f(_ydiff,y-_y);
		
		//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_zero,bm_one)
		//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_zero)
		//draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
		
		gpu_set_blendmode(bm_normal)
		if(y-_y<=0) {
			//gpu_set_blendmode_ext_sepalpha(bm_one,bm_zero,bm_one,bm_zero)
			gpu_set_blendmode(bm_subtract)
			//gpu_set_blendmode(bm_subtract)
			//draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
		} else {
			gpu_set_blendmode(bm_add)
		}
		draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
		surface_reset_target()
	}
	shader_reset()
	
	gpu_set_blendmode(bm_normal);
	//gpu_set_blendmode(bm_subtract)
	
	tempSurface = surface_create(oPlayer.sprite_width,oPlayer.sprite_height);
	
	surface_copy_part(
		tempSurface,
		0,0,
		_shaderSurface,
		oPlayer.x-camera_get_view_x(view_camera[0])-oPlayer.sprite_width/2,oPlayer.y-camera_get_view_y(view_camera[0])-oPlayer.sprite_height,
		oPlayer.sprite_width,oPlayer.sprite_height
	)
	
	//gpu_set_blendmode_ext_sepalpha();
	//shader_set_uniform_f(_ptexlw,y-_y);
	//var WDtexelW = texture_get_texel_width(sprite_get_texture(oPlayer.sprite_index,oPlayer.image_index))
	//var WDtexelH = texture_get_texel_height(sprite_get_texture(oPlayer.sprite_index,oPlayer.image_index))
	//var uvs = sprite_get_uvs(oPlayer.sprite_index,oPlayer.image_index)
	
	//shader_set_uniform_f(_uWDpixelDims,WDtexelW,WDtexelH)
	//shader_set_uniform_f(_uniUV, uvs[0], uvs[1], uvs[2], uvs[3]);
	//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_zero,bm_zero,bm_one)
	
	//gpu_set_blendmode_ext_sepalpha(bm_one,bm_zero,bm_one,bm_one)
	//gpu_set_blendmode(bm_subtract);
	//shader_set(shPlayerLighting);
	
	
	//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_zero,bm_one)
	
	
	shader_set(shPlayerLighting);
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_one)
	with(oPlayer) {
		surface_set_target(_shaderSurface)
		//shader_set_uniform_f(_ydiff,-1);
		//shader_set_uniform_f(_subtractOn,true);
		draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))//,1,1,0,c_black,0
		surface_reset_target()
	}
	shader_reset()
	gpu_set_blendmode(bm_normal)
	//show_debug_message(surface_get_height(_shaderSurface));
	
	
	
	/*
	surface_copy_part(
		_shaderSurface,
		oPlayer.x-camera_get_view_x(view_camera[0])-oPlayer.sprite_width/2,oPlayer.y-camera_get_view_y(view_camera[0])-oPlayer.sprite_height-16,//-16
		tempSurface,
		0,0,
		surface_get_width(tempSurface),
		surface_get_height(tempSurface)
	)*/
	
	
	
	
	
	/*
	surface_copy_part(
		_shaderSurface,10,10,//-16
		_shaderSurface,
		0,0,
		oPlayer.sprite_width,oPlayer.sprite_height
	)*/
	/*surface_copy_part(
		_shaderSurface,oPlayer.x-camera_get_view_x(view_camera[0])-oPlayer.sprite_width/2,oPlayer.y-camera_get_view_y(view_camera[0])-oPlayer.sprite_height,//-16
		_shaderSurface,
		oPlayer.x-camera_get_view_x(view_camera[0])-oPlayer.sprite_width/2,oPlayer.y-camera_get_view_y(view_camera[0])-oPlayer.sprite_height,
		oPlayer.sprite_width,oPlayer.sprite_height
	)*/
	//draw_sprite(oPlayer.sprite_index,oPlayer.image_index,oPlayer.x-camera_get_view_x(view_camera[0]),oPlayer.y-camera_get_view_y(view_camera[0]))
	//shader_reset()
	//gpu_set_blendmode(bm_normal);
	
	
	
	
	//leave this tuff alone it works (need to fix colors tho)
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
draw_surface_ext(_shaderSurface,
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