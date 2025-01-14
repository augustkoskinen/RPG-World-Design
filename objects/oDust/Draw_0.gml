if(curlife>=maxlife) {
	instance_destroy()
}

shader_set(shDrawColor)
//shader_set_uniform_f(u_color,c_green);

if(curlife<maxlife-2) {
	shader_set_uniform_f(u_alpha,min(curlife/2,1));
	draw_sprite(sprite_index,image_index,x,y);//curlife
} else if(curlife>=maxlife-2) {
	shader_set_uniform_f(u_alpha,(maxlife-curlife)/2);
	draw_sprite(sprite_index,image_index,x,y);//maxlife-curlife
}
shader_reset()

_direction += random_range(0,3) * (irandom_range(0,1)*2-1);
_speed += random_range(0.05,1) * (irandom_range(0,1)*2-1);

x+=lengthdir_x(_speed,_direction)*delta_time/1000000;
y+=lengthdir_y(_speed,_direction)*delta_time/1000000;

curlife+=delta_time/1000000