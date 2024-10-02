var scale = 1;
var sprite = sLight;

if (!surface_exists(self.light_surface)) {
    self.light_surface = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}
if (!surface_exists(self.light_surface2)) {
    self.light_surface2 = surface_create(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0]))
}

surface_set_target(self.light_surface);
draw_clear(#000020);
camera_apply(view_camera[0]);
gpu_set_blendmode(bm_subtract);

with (oLightPar) {
	scale = 2 + 0.125 * sin(current_time / 400);
    draw_sprite_ext(sprite, 0, self.x+lightx, self.y+lighty, scale, scale, 0, c_white, 1);
}
/*
with (oPlayer) {
	scale = 1;
	draw_sprite_ext(sprite, 0, self.x, self.y-16, scale, scale, 0, c_white, 1);
}
*/

gpu_set_blendmode(bm_normal);
surface_reset_target();