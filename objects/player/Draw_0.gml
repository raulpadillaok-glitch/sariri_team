shader_set(light_shader);
shader_set_uniform_f(u_posz, altitude);
image_xscale = xscale;
image_yscale = yscale;
draw_self();
image_xscale = 1;
image_yscale = 1;
shader_set_uniform_f(u_posz, 0);
shader_reset();
if(Health > 0)
{
	var cam = view_camera[0];
	var camx = camera_get_view_x(cam);
	var camy = camera_get_view_y(cam);
	var width = camera_get_view_width(cam);
	health_bar.set_vars(true, x - 32, y - 60, x + 32, y - 52, 100 * (Health / max_health));
	lightbar.set_vars(true, camx + width / 2 - 128, camy + 16, camx + width / 2 + 128, camy + 32, 100 * (my_light.strength / max_strength));
}
else
{
	health_bar.draw = false;
	lightbar.draw = false;
}
if(sound_manager.end_sound)
{
	lightbar.draw = false;
}

