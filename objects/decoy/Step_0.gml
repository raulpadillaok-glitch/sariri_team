xspd = 0;
yspd = 0;

if(Health > 0)
{
	if(!instance_exists(my_light))
	{
		instance_activate_object(my_light);
	}
	
	if(active)
	{
		if(keyboard_check(ord("S")))
		{
			yspd++;
		}
		if(keyboard_check(ord("W")))
		{
			yspd--;
		}
		if(keyboard_check(ord("D")))
		{
			xspd++;
			dir = 1;
		}
		if(keyboard_check(ord("A")))
		{
			xspd--;
			dir = -1;
		}
		if(xspd != 0 && yspd != 0)
		{
			xspd /= sqrt(2);
			yspd /= sqrt(2);
		}
		
		xspd *= spd;
		yspd *= spd;
	}

	x += xspd;
	y += yspd;

	if(instance_place(x, y, wall))
	{
		x -= xspd;
	}
	if(instance_place(x, y, wall))
	{
		y -= yspd;
	}

	my_light.x = x;
	my_light.y = y;
	
	my_light.active = active;
	
	if(xspd != 0)
	{
		image_xscale = dir;
	}
	
	Health--;
}
else
{
	active = false;
	player.active = true;
	instance_deactivate_object(self);
	instance_deactivate_object(my_light);
	Health = max_health;
}

