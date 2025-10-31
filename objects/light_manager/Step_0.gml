if(instance_exists(brazier))
{
	if(!brazier.unlit)
	{
		min_light_value = min(min_light_value + (1 / (2 * room_speed)), 1);
	}
}

