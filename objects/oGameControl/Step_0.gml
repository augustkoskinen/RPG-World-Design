time = 800;//+=delta_time/1000000;

if(time>=SECS_PER_DAY) {
	time-=SECS_PER_DAY;
	days++;
}