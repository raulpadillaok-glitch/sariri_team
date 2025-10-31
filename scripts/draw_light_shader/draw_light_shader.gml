function draw_light_shader()
{
	shader_set(light_shader);
	draw_self();
	shader_reset();
}