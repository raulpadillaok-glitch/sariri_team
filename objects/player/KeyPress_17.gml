///@description Decoy
if(can_decoy && decoy_timer <= 0 && altitude == ground_height && dash <= 0)
{
	if(!instance_exists(my_decoy))
	{
		instance_activate_object(my_decoy);
		my_decoy.x = x;
		my_decoy.y = y;
	}
	show_debug_message(active);
	active = !active;
	my_decoy.active = !my_decoy.active;
	show_debug_message(active);
}

