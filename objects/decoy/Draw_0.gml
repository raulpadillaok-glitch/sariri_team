shader_set(light_shader);
draw_self();
shader_reset();
if(Health > 0)
{
	health_bar.set_vars(true, x - 32, y - 60, x + 32, y - 56, 100 * (Health / max_health));
}
else
{
	health_bar.set_vars(false);
}

