var dist = 0;

if(instance_exists(decoy))
{
	dist = distance(x, decoy.x, y, decoy.y);
	if(dist <= active_distance)
	{
		image_alpha = 1;
		image_blend = c_white;
		  if (chase_timer <= 0) {
            chase_timer = chase_duration; // Comienza a contar 2 segundos
        }
        
        // SOLO PERSIGUE SI EL TEMPORIZADOR NO HA LLEGADO A CERO
        if (chase_timer > 0)
	
		targetx = decoy.x;
		targety = decoy.y;
	}
}
else
{
	dist = distance(x, player.x, y, player.y);
	if(dist <= active_distance)
	{
		image_alpha = 1;
		image_blend = c_white;
	
		if(charge)
		{
			targetx = player.x;
			targety = player.y;
		}
		else
		{
			if(alarm[0] < 0)
			{
				audio_play_sound(hey_sounds[irandom_range(0, 1)], 1, false, 1, .2);
				alarm[0] = room_speed * .25;
			}
		}
	}
	else
	{
		image_alpha = .8;
		image_blend = c_grey;
		targetx = xstart;
		targety = ystart;
		charge = false;
	}
}

direction = point_direction(x, y, targetx, targety);
dist = distance(x, targetx, y, targety);
speed = clamp(dist, -spd, spd);

