function get_light_shader_uniforms()
{
	u_light_colours = shader_get_uniform(light_shader, "light_colours");
	u_light_positions = shader_get_uniform(light_shader, "light_positions");
	u_light_strengths = shader_get_uniform(light_shader, "light_strengths");
	u_light_ranges = shader_get_uniform(light_shader, "light_ranges");
	u_light_source_count = shader_get_uniform(light_shader, "light_source_count");
	
	light_colours = [1, 1, 1];
	light_positions = [player.x, player.y];
	light_strengths = [1];
	light_ranges = [640];
	light_source_count = 1;
}