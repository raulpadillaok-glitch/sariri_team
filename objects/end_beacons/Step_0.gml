if(!lit)
{
	set_lit();
	if(lit)
	{
		my_light = instance_create_layer(x, y, "Light", light);
		my_light.red = colour_get_red(colour) / 255;
		my_light.green = colour_get_green(colour) / 255;
		my_light.blue = colour_get_blue(colour) / 255;
		my_light.strength = 1;
		my_light.range = 640;
	
		ps = fire_part.ps;
	
		type = part_type_create();
		part_type_colour3(type, c_yellow, c_orange, c_red);
		part_type_speed(type, 1, 1.5, 1, .1);
		part_type_direction(type, 60, 120, 0, 8);
		part_type_sprite(type, spr_fire_part, false, false, false);
		part_type_size(type, 3, 4, -.3, .1);
		part_type_life(type, 7, 9);
	
		emitter = part_emitter_create(ps);
		part_emitter_region(ps, emitter, x - 8, x + 8, y - 24, y - 20, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_stream(ps, emitter, type, 1);
		
		save_game();
		
		brazier.lit++;
	}
}
else if(instance_exists(spark) && instance_place(x, y, spark))
{
	save_game();
}

