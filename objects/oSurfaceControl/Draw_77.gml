shader_set(sGrayFilter)

draw_surface(application_surface, 0, 0);

draw_set_alpha(clamp(0,.75,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY))));
draw_surface_stretched(self.light_surface, 0, 0, window_get_width(), window_get_height());
draw_set_alpha(1);

shader_reset();