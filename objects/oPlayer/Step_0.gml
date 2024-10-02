var _dt = delta_time/1000000;
var rl = keyboard_check(ord("D"))-keyboard_check(ord("A"))
var du = keyboard_check(ord("S"))-keyboard_check(ord("W"))

var addx = 0;
var addy = 0;
if(rl!=0||du!=0) {
	dir = round(point_direction(0,0,rl,du))
	
	addx = _dt*lengthdir_x(!keyboard_check(vk_control) ? MOVE_SPEED : MOVE_SPEED*10,dir)
	addy = _dt*lengthdir_y(!keyboard_check(vk_control) ? MOVE_SPEED : MOVE_SPEED*10,dir)
}

if (addx != 0 || addy != 0){
	if(collision_line(x+addx,y,x,y,oEnvironmentPar,true,true)||place_meeting(x+addx,y,oEnvironmentPar)) {
		while (!collision_line(x+0.5*(addx/abs(addx)),y,x,y,oEnvironmentPar,true,true)&&!place_meeting(x+0.5*(addx/abs(addx)),y,oEnvironmentPar)) {
			x += 0.5*(addx/abs(addx));
		}
		addx = 0;
	}
	x += addx;
		
	if(collision_line(x,y+addy,x,y,oEnvironmentPar,true,true)||place_meeting(x,y+addy,oEnvironmentPar)) {
		while (!collision_line(x,y+0.5*(addy/abs(addy)),x,y,oEnvironmentPar,true,true)&&!place_meeting(x,y+0.5*(addy/abs(addy)),oEnvironmentPar)) {
			y += 0.5*(addy/abs(addy));
		}
		addy = 0;
	}
	y += addy;
}

depth = -y