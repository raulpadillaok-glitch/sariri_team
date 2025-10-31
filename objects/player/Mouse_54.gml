///@description Fireball
if(can_fire && active && spark_timer <= 0 && fireball_timer <= 0 && altitude == ground_height && dash <= 0)
{
	var x_dist = mouse_x - x;
	var y_dist = mouse_y - y;
	var total_dist = distance(0, x_dist, 0, y_dist);
	var multiplier = fireball_dist / total_dist;
	x_dist *= multiplier;
	y_dist *= multiplier;
	
	fireballx = x + x_dist;
	firebally = y + y_dist;
	create_fireball = true;
	play_fireball_sound = true;
	
	fireball_timer = room_speed * (1.33333);
	
	dir = mouse_x > x ? 1 : -1;
}

