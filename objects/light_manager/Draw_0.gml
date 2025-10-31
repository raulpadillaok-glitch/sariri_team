var light_count = 0;
for(var i = 0 ; i < instance_number(light); i++)
{
	var my_light = instance_find(light, i);
	
	if(my_light.active)
	{
		light_colours[3 * light_count] = my_light.red;
		light_colours[3 * light_count + 1] = my_light.green;
		light_colours[3 * light_count + 2] = my_light.blue;
	
		light_positions[3 * light_count] = my_light.x;
		light_positions[3 * light_count + 1] = my_light.y;
		light_positions[3 * light_count + 2] = my_light.altitude;
	
		light_strengths[light_count] = my_light.strength;
	
		light_ranges[light_count] = my_light.range;
		
		light_count++;
	}
}

light_source_count = light_count;
min_light = [min_light_value, min_light_value, min_light_value];
max_light = [max_light_value, max_light_value, max_light_value];

shader_set(light_shader);
shader_set_uniform_f_array(u_light_colours, light_colours);
shader_set_uniform_f_array(u_light_positions, light_positions);
shader_set_uniform_f_array(u_light_strengths, light_strengths);
shader_set_uniform_f_array(u_light_ranges, light_ranges);
shader_set_uniform_i(u_light_source_count, light_source_count);
shader_set_uniform_f_array(u_min_light, min_light);
shader_set_uniform_f_array(u_max_light, max_light);
shader_reset();

