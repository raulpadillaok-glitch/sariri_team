speed = 15;

my_light = instance_create_layer(x, y, "Light", light);
my_light.red = colour_get_red(colour) / 255;
my_light.green = colour_get_green(colour) / 255;
my_light.blue = colour_get_blue(colour) / 255;
my_light.strength = 1.5;
my_light.range = 256;

alarm[0] = room_speed * 2;

