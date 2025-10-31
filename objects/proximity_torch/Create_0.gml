my_light = noone;
emitter = noone;
ps = fire_part.ps;
burn_time = -1;
active_distance = 320;
max_strength = 1;

if(lit)
{
	my_light = instance_create_layer(x, y, "Light", light);
	my_light.red = colour_get_red(colour) / 255;
	my_light.green = colour_get_green(colour) / 255;
	my_light.blue = colour_get_blue(colour) / 255;
	my_light.strength = max_strength; 
	
	type = part_type_create();
	part_type_colour3(type, c_yellow, c_orange, c_red);
	part_type_speed(type, 1, 1.5, 1, .1);
	part_type_direction(type, 75, 105, 0, 2);
	part_type_sprite(type, spr_fire_part, false, false, false);
	part_type_size(type, 2, 1, -.2, .1);
	part_type_life(type, 5, 7);
	
	emitter = part_emitter_create(ps);
	part_emitter_region(ps, emitter, x - 4, x + 4, y - 12, y - 8, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_stream(ps, emitter, type, 1);
}

set_lit = function()
{
	if(instance_exists(spark) && instance_place(x, y, spark))
	{
		lit = true;
	}
	else
	{
		var nearest_spark = instance_nearest(x, y, preview_spark);
		if(nearest_spark != noone && distance(x, nearest_spark.x, y, nearest_spark.y) <= active_distance)
		{
			lit = true;
			burn_time = room_speed;
		}
	}
}

ds_map_add(game_manager.torch_states, string(id), lit);

