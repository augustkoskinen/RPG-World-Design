if(!surface_exists(shaderSurface))
	shaderSurface = surface_create(
		camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])
	)

//Local variables setup
var _u_pos = u_pos;
var _u_pos2 = u_pos2;
var _vb = vb;
var _drawShadow = drawShadow;
var _uWDpixelDims = uWDpixelDims
var _uniUV = uniUV;
var _shaderSurface = shaderSurface;
var _subtractOn = subtractOn;

//draw_clear_alpha(c_white,1)//====================|
surface_set_target(shaderSurface)
draw_clear_alpha(c_black,0)

//show_debug_message(clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY))))

//solve two problems; 
//one, drawing shadows (hopefully offset on top of player)
//two, having no shadows if there is open area present already

with(oLightPar){
	var _x = x
	var _y = y

	
	gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_one,bm_zero)
    shader_set(shShadow);
    shader_set_uniform_f(_u_pos2,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));
    vertex_submit(_vb,pr_trianglelist,-1);
	
	/*
	tempSurface = surface_create(oPlayer.sprite_width,oPlayer.sprite_height);
	
	surface_copy_part(
		tempSurface,
		0,0,
		_shaderSurface,
		oPlayer.bbox_left-camera_get_view_x(view_camera[0]),oPlayer.bbox_bottom-oPlayer.sprite_height-camera_get_view_y(view_camera[0]),
		oPlayer.bbox_right-oPlayer.bbox_left,oPlayer.sprite_height
	)
	
	with(oPlayer) {
		gpu_set_blendmode(bm_subtract);
		shader_set(shPlayerLighting);
		shader_set_uniform_f(_ydiff,y-_y);
		surface_set_target(_shaderSurface)
		draw_sprite_ext(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]),1,1,0,c_black,0)
		surface_reset_target()
	}
	
	surface_copy_part(
		_shaderSurface,
		oPlayer.bbox_left-camera_get_view_x(view_camera[0]),oPlayer.bbox_bottom-oPlayer.sprite_height-camera_get_view_y(view_camera[0])-2,
		tempSurface,
		0,0,
		oPlayer.bbox_right-oPlayer.bbox_left,oPlayer.sprite_height
	)*/
	
	//leave this tuff alone it works (need to fix colors tho)
    //gpu_set_blendmode_ext_sepalpha(bm_dest_alpha,bm_src_alpha,bm_zero,bm_zero)
	
	gpu_set_blendmode_ext_sepalpha(bm_inv_dest_alpha,bm_one,bm_zero,bm_zero)
	gpu_set_blendequation_sepalpha(bm_eq_max,bm_eq_add)

	//gpu_set_blendmode_ext(bm_one,bm_zero)
	//gpu_set_blendmode(bm_max)
    shader_set(shLighting);
    shader_set_uniform_f(_u_pos,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]));

    draw_rectangle_color(0,0,
		camera_get_view_width(view_camera[0]),
		camera_get_view_height(view_camera[0]),
		lightcolor,lightcolor,lightcolor,lightcolor,0
	);
    gpu_set_blendmode(bm_normal);
	gpu_set_blendequation_sepalpha(bm_eq_add,bm_eq_add)
}

var xlist = array_create(0);
var ylist = array_create(0);

with(oLightPar){
	
	/*
	var _x = x
	var _y = y
	shader_set(shDrawShape);
	with(oSolidPar) {
		shader_set_uniform_f(_ydiff,y-_y);
		gpu_set_blendmode(bm_subtract)
		if(y-_y<=0&&collision_circle(_x,_y,128,id,false,false)) {
			lightchecked = true;
			gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_zero,bm_zero)
			//gpu_set_blendmode(bm_subtract) //light case
		} else if(!lightchecked){
			gpu_set_blendmode(bm_max) //shadow case
			
		}
		//draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
	}
	shader_reset()
	
	
	*/
	//gpu_set_blendmode_ext_sepalpha(bm_zero,bm_one,bm_zero,bm_zero)
	//draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
	array_push(ylist,y)
	array_push(xlist,x)

	lightchecked = false;
}

shader_reset();


with(oSolidPar) {
	shader_set(shDrawShape);
	
	for(var i = 0; i < array_length(ylist); i++)
		if(collision_circle(array_get(xlist,i),array_get(ylist,i),128,id,false,false)) {
			if(y<=array_get(ylist,i)) { //light
				gpu_set_blendmode(bm_subtract)
				break;
			} else { //shadow
				gpu_set_blendequation_sepalpha(bm_eq_subtract,bm_eq_add)
			}
			draw_sprite(sprite_index,image_index,x-camera_get_view_x(view_camera[0]),y-camera_get_view_y(view_camera[0]))
		}
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
	c_black,
	clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY)))
)
shader_reset();
gpu_set_blendmode(bm_normal)