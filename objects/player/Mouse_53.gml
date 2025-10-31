///@description Spark
if(can_spark && active && spark_timer <= 0 && fireball_timer <= 0 && altitude == ground_height && dash <= 0)
{
	audio_play_sound(sn_spark, 1, false);
	
	var x_dist = mouse_x - x;
	var y_dist = mouse_y - y;
	var total_dist = distance(0, x_dist, 0, y_dist);
	var multiplier = spark_dist / total_dist;
	x_dist *= multiplier;
	y_dist *= multiplier;
	
	sparkx = x + x_dist;
	sparky = y + y_dist;
	create_spark = true;
	
	spark_timer = room_speed;
	
	dir = mouse_x > x ? 1 : -1;
}

