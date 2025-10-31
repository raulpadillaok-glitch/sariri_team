move = false;
if(dash <= dash_stun_time)
{
	xspd = 0;
	yspd = 0;
	animate = false;
}
if(dash > 0)
{
	sprite_index = spr_player_dash;
}
else if(spark_timer > 0)
{
	if(sprite_index != spr_player_spark)
	{
		sprite_index = spr_player_spark;
		image_index = 0;
	}
	animate = true;
}
else if(fireball_timer > 0)
{
	if(sprite_index != spr_player_fireball)
	{
		sprite_index = spr_player_fireball;
		image_index = 0;
	}
	animate = true;
}
else
{
	sprite_index = spr_player;
}


if(Health > 0)
{
	var near_beacon = instance_nearest(x, y, beacon);
	var near_end_beacon = instance_nearest(x, y, end_beacons);
	near_beacon = distance(x, near_beacon.x, y, near_beacon.y) < distance(x, near_end_beacon.x, y, near_end_beacon.y) ? near_beacon : near_end_beacon;
	if(near_beacon.lit && distance(x, near_beacon.x, y, near_beacon.y) <= sound_manager.crackle_range)
	{
		my_light.strength = max_strength;
		Health = min(Health + heal_amount, max_health);
	}
	
	if(active)
	{
		get_ground_height();
	
		if(altitude == ground_height)
		{
			zspd = 0;
			if(keyboard_check(vk_space))
			{
				zspd = sqrt(-2 * jump_height * grav);
			}
		}
		altitude = max(altitude + zspd, ground_height);
		zspd += grav;
	
		if(dash > dash_stun_time)
		{
			zspd = 0;
		}
	
		if(altitude >= 0)
		{
			if(dash <= 0 && spark_timer <= 0 && fireball_timer <= .3333)
			{
				move = true;
				if(keyboard_check(ord("S")))
				{
					yspd++;
					animate = true;
				}
				if(keyboard_check(ord("W")))
				{
					yspd--;
					animate = true;
				}
				if(keyboard_check(ord("D")))
				{
					xspd++;
					dir = 1;
					animate = true;
				}
				if(keyboard_check(ord("A")))
				{
					xspd--;
					dir = -1;
					animate = true;
				}
			
				if(can_dash && dash <= -dash_cooldown && (xspd != 0 || yspd != 0))
				{
					if(keyboard_check_pressed(vk_shift))
					{
						audio_play_sound(sn_dash, 1, false);
						dash = dash_time + dash_stun_time;
					
						xspd /= sqrt(2);
						yspd /= sqrt(2);
					
						xspd *= dash_spd;
						yspd *= dash_spd;
						
						zspd = 0;
					}
				}
			}

			if(dash <= 0)
			{
				if(xspd != 0 && yspd != 0)
				{
					xspd /= sqrt(2);
					yspd /= sqrt(2);
				}
		
				xspd *= spd;
				yspd *= spd;
			}

			x += xspd;
			if(instance_place(x, y, wall) || (instance_exists(door) && instance_place(x, y, door) && instance_place(x, y, door).active))
			{
				x -= xspd;
			}
			
			y += yspd;
			if(instance_place(x, y, wall) || (instance_exists(door) && instance_place(x, y, door) && instance_place(x, y, door).active))
			{
				y -= yspd;
			}

		}
	
		image_speed = animate ? 1 : 0;
		if(sprite_index == spr_player)
		{
			if(altitude != ground_height)
			{
				image_index = 3;
			}
			else if(!animate)
			{
				image_index = 2;
			}
		
		}

		my_light.x = x;
		my_light.y = y;
		my_light.altitude = altitude;

		xscale = dir * max((((altitude / jump_height) * .5) + 1), min_size);
		yscale = max(((altitude / jump_height) * .5) + 1, min_size);
	}
}
else if(spawn_dead)
{
	instance_create_layer(x, y, "Player", dead_player);
	image_alpha = 0;
	
	alarm[2] = room_speed * 3;
	spawn_dead = false;
}

if(dash > -dash_cooldown)
{
	dash--;
}

if(spark_timer > 0)
{
	spark_timer--;
	if(create_spark && spark_timer <= room_speed / 2)
	{
		instance_create_layer(sparkx, sparky, "Spells", spark);
		create_spark = false;
	}
}

if(fireball_timer > 0)
{
	fireball_timer--;
	if(create_fireball && fireball_timer <= room_speed * .33333)
	{
		var _fireball = instance_create_layer(fireballx, firebally, "Spells", fireball);
		_fireball.direction = point_direction(x, y, fireballx, firebally);
		_fireball.image_angle = _fireball.direction;
		create_fireball = false;
	}
	if(play_fireball_sound && fireball_timer <= room_speed * .5)
	{
		audio_play_sound(sn_fire_woosh, 1, false);
		play_fireball_sound = false;
	}
}

if(oof_timer > 0)
{
	oof_timer--;
}

var near_torch = instance_nearest(x, y, torch);
var multiplier = 1;
if(point_distance(x, y, near_torch.x, near_torch.y) < near_torch.my_light.range)
{
	multiplier = .3;
}
my_light.strength = max(my_light.strength - (burn_rate * multiplier), 0);
my_light.range = max_range * sqrt(my_light.strength) / sqrt(max_strength);
my_light.active = active;

if(my_light.strength == 0)
{
	Health = 0;
}
if(altitude <= jump_height * -2)
{
	Health = 0;
	if(spawn_dead)
	{
		image_alpha = 0;
		alarm[2] = room_speed;
		spawn_dead = false;
		my_light.strength = 0;
	}
}

