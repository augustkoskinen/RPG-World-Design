time += 100*delta_time/1000000; //800

if(time>=SECS_PER_DAY) {
	time-=SECS_PER_DAY;
	days++;
}