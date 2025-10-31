if(instance_exists(decoy) && decoy.active)
{
	image_alpha = 1;
	var cam = view_camera[0];
	x = camera_get_view_x(cam);
	y = camera_get_view_y(cam);
}
else
{
	image_alpha = 0;
}

