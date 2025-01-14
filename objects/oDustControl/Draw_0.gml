if(irandom_range(0,2) == 0 && instance_number(oDust) < 20) {
	var inst = instance_create_layer(oPlayer.x+random_range(camera_get_view_width(view_camera[0])/2,-camera_get_view_width(view_camera[0])/2),
		oPlayer.y+random_range(camera_get_view_height(view_camera[0])/2,-camera_get_view_height(view_camera[0])/2),
		"Dust",
		oDust
	)
	
	inst.image_index = irandom_range(0,2)
	inst.maxlife = irandom_range(4,10)
	inst._direction = irandom_range(0,359);
	inst._speed = irandom_range(0.5,7);
	inst.image_speed = 0;
}