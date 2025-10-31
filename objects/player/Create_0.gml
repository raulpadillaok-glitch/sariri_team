active = true;
spd = 6;
xspd = 0;
yspd = 0;
zspd = 0;
xscale = image_xscale;
yscale = image_yscale;
dash_distance = 640;
dash_stun_time = room_speed / 8;
dash_time = room_speed / 4;
dash_spd = dash_distance / dash_time;
dash_cooldown = room_speed / 2;
dash = -dash_cooldown;
altitude = 0;
grav = -.8;
jump_height = 160;
Health = 10;
max_health = 10;
heal_amount = max_health / room_speed;
max_strength = 1;
burn_rate = (max_strength / 30) / room_speed;
//burn_rate = 0;
max_range = 420;
dir = 1;
ground_height = 0;
min_size = max(1 / abs(bbox_right - bbox_left), 1 / abs(bbox_top - bbox_bottom)) * 2;
animate = false;
create_spark = false;
sparkx = 0;
sparky = 0;
spark_timer = 0;
spark_dist = 64;
create_fireball = false
play_fireball_sound = false;
fireballx = 0;
firebally = 0;
fireball_timer = 0;
fireball_dist = 32;
decoy_timer = 0;
oof_timer = 0;
oof_sounds = [sn_oof1, sn_oof2, sn_oof3, sn_oof4];
ghost_sounds = [sn_ghost1, sn_ghost2, sn_ghost3];

can_spark = true;
can_dash = false;
can_fire = false
can_decoy = false;
spawn_dead = true;

my_light = instance_create_layer(x, y, "Light", light);
my_light.range = max_range;
my_light.strength = max_strength;
my_light.red = colour_get_red(colour) / 255;
my_light.green = colour_get_green(colour) / 255;
my_light.blue = colour_get_blue(colour) / 255;

my_decoy = instance_create_layer(x, y, "Player", decoy);
instance_deactivate_object(my_decoy);

lightbar = instance_create_layer(x, y, "Healthbar", healthbar);
lightbar.set_vars(false, x, y, x, y, 0, #101020, c_yellow, c_yellow);

health_bar = instance_create_layer(x, y, "Healthbar", healthbar);
health_bar.set_vars(false, x - 32, y - 60, x + 32, y - 52, 100 * (Health / max_health), c_black, c_red, c_green);

u_posz = shader_get_uniform(light_shader, "posz");

get_ground_height = function()
{
	ground_height = 0;
	if(instance_exists(voidcollision))
	{
		if(instance_place(x, y, voidcollision))
		{
			ground_height = -infinity;
		}
	}
}

reset = function()

{
	x = game_manager.previous_beacon.x;
	y = game_manager.previous_beacon.y;
	
	xscale = 1;
	yscale = 1;
	image_alpha = 1;
	
	dash = 0;
	altitude = 0;
	spark_timer = 0;
	fireball_timer = 0;
	active = true;
	
	if(instance_exists(my_decoy))
	{
		my_decoy.Health = my_decoy.max_health;
		my_decoy.active = false;
		instance_deactivate_object(my_decoy);
	}
	
	
	//	Reset torches
	for(var i = 0; i < instance_number(torch); i++)
	{
		var my_torch = instance_find(torch, i);
		if(my_torch.lit && !ds_map_find_value(game_manager.torch_states, string(my_torch)))
		{
			game_manager.lit_torches--;
		}
		my_torch.lit = ds_map_find_value(game_manager.torch_states, string(my_torch));
		if(!my_torch.lit)
		{
			if(my_torch.my_light != noone)
			{
				instance_destroy(my_torch.my_light);
				my_torch.my_light = noone;
			}
			if(my_torch.emitter != noone)
			{
				part_emitter_destroy(my_torch.ps, my_torch.emitter);
				my_torch.emitter = noone;
			}
		}
	}
	
	//	Reset knights
	for(var i = 0; i < instance_number(knight); i++)
	{
		var my_knight = instance_find(knight, i);
		my_knight.x = ds_map_find_value(game_manager.enemy_positionsx, string(instance_find(knight, i)));
		my_knight.y = ds_map_find_value(game_manager.enemy_positionsy, string(instance_find(knight, i)));
	}
	
	Health = max_health;
	my_light.strength = max_strength;
	
	instance_destroy(dead_player);
	spawn_dead = true;
}

move = false;

