if(surface_exists(shaderSurface)) {
	gpu_set_blendmode_ext(bm_zero,bm_src_color)
	shader_set(shShadSurf)
	depth = oPlayer.depth+1000;
	draw_surface_part_ext(shaderSurface,
		0,0,
		camera_get_view_width(view_camera[0]),
		camera_get_view_height(view_camera[0]),
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		1,
		1,
		c_black,
		clamp(-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY)),0,.5)+0.125
	)
	shader_reset();
	gpu_set_blendmode(bm_normal)
}