if(keyboard_check(ord("C"))) {
	camera_set_view_size(view_camera[0],6400,4800);
} else {
	camera_set_view_size(view_camera[0],384,240);
}

CamW = camera_get_view_width(view_camera[0]);
CamH = camera_get_view_height(view_camera[0]);

camera_set_view_pos(
	view_camera[0],
	lerp(camera_get_view_x(view_camera[0]), oPlayer.x - (CamW / 2), .05),
	lerp(camera_get_view_y(view_camera[0]), oPlayer.y - oPlayer.sprite_height/2 - (CamH / 2), .05)
);

x = camera_get_view_x(view_camera[0])
y = camera_get_view_y(view_camera[0])
