spd = 8;
xspd = 0;
yspd = 0;
max_strength = 1;
max_range = 420;
dir = 1;
active = false;
max_health = 5 * room_speed;
Health = max_health;

my_light = instance_create_layer(x, y, "Light", light);
my_light.range = max_range;
my_light.strength = max_strength;
my_light.red = colour_get_red(colour) / 255;
my_light.green = colour_get_green(colour) / 255;
my_light.blue = colour_get_blue(colour) / 255;
instance_deactivate_object(my_light);

health_bar = instance_create_layer(x, y, "Healthbar", healthbar);
health_bar.set_vars(false, x - 32, y - 60, x + 32, y - 56, 100 * (Health / max_health), c_black, colour, colour);

