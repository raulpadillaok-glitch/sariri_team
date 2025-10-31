swap_room = menu;
decrease_lighting = false;
room_goto(menu);

for(var i = 0; i < instance_number(torch); i++)
{
	var my_torch = instance_find(torch, i);
		
	my_torch.lit = false
	
	if(my_torch.my_light != noone)
	{
		instance_destroy(my_torch.my_light);
		my_torch.my_light = noone;
	}
	if(my_torch.emitter != noone)
	{
		part_emitter_destroy(my_torch.ps, my_torch.emitter);
		my_torch.emitter = noone;
	}
}

for(var i = 0; i < instance_number(beacon); i++)
{
	var my_beacon = instance_find(beacon, i);
		
	my_beacon.lit = false
	
	if(my_beacon.my_light != noone)
	{
		instance_destroy(my_beacon.my_light);
		my_beacon.my_light = noone;
	}
	if(my_beacon.emitter != noone)
	{
		part_emitter_destroy(my_beacon.ps, my_beacon.emitter);
		my_beacon.emitter = noone;
	}
}

part_system_destroy(fire_part.ps);

