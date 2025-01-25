var scale = (lightscale/32) + 0.125 * sin(current_time / lightspeedchange);
draw_self()

depth = -(y+lighty-scale*32)
//draw_sprite_ext(sLight, 0, self.x+lightx, self.y+lighty, scale, scale, 0, make_color_rgb(lightcolorr,lightcolorg,lightcolorb), clamp(0,.5,-dsin(oGameControl.time*(360/oGameControl.SECS_PER_DAY))));
depth = -y

var flickerlow = 0.1;
var flickerhigh = 0.2;

if(flickerwait<0) {
	if(!oscilating) {
		flickerwait = random_range(flickerlow,flickerhigh);
		targetflicker = random_range(0.3,0.5);
		prevtargetflicker = targetflicker;
		oscilating = true;
	} else if(oscilating) {
		if(targetflicker<.8) {
			if(prevtargetflicker>=0.7) {
				targetflicker = 1;
				oscilating = false;
				flickerwait = random_range(0.5,10);
			} else {
				targetflicker = 1;
				flickerwait = random_range(flickerlow,flickerhigh);
			}
		} else {
			targetflicker = min(prevtargetflicker+random_range(0.0625,0.125),0.7)
			prevtargetflicker = targetflicker;
			flickerwait = random_range(flickerlow,flickerhigh)
		}
	}
}


if(!oscilating) {
	targetflicker = 1;
}

flickerwait -= delta_time/1000000
flickerstr = (targetflicker-flickerstr)*.125 + flickerstr