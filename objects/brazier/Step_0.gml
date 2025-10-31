if(lit >= 4 && unlit)
{
	my_light = instance_create_layer(x, y, "Light", light);
	my_light.red = colour_get_red(colour) / 255;
	my_light.green = colour_get_green(colour) / 255;
	my_light.blue = colour_get_blue(colour) / 255;
	my_light.strength = 1;
	my_light.range = 640;
	unlit = false;
	image_speed = 1;
}
if(image_index > image_number - 1)
{
	image_speed = 0;
	
}

