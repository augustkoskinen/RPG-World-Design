var scale = (lightscale/32) + 0.125 * sin(current_time / lightspeedchange);
draw_self()

depth = -(y+lighty-scale*32)
//draw_sprite_ext(sLight, 0, self.x+lightx, self.y+lighty, scale, scale, 0, make_color_rgb(lightcolorr,lightcolorg,lightcolorb), clamp(0,.5,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY))));
depth = -y