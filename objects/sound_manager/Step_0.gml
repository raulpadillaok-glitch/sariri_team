if(swap_room == game)
{
	audio_sound_gain(menu_sound, 0, 1000);
	audio_sound_set_track_position(game_sound, 0);
	audio_sound_gain(game_sound, 1, 1000);
	light_manager.min_light_value = 0;
	light_manager.max_light_value = 1;
	play_speed_run = false;
	prev_speed_run = false;
	end_sound = false;
	prev_end_sound = false;
	decrease_lighting = false;
	swap_room = noone;
}
if(swap_room == menu)
{
	audio_sound_gain(game_sound, 0, 0);
	audio_sound_set_track_position(menu_sound, 0);
	audio_sound_gain(menu_sound, 1, 0);
	light_manager.min_light_value = 0;
	light_manager.max_light_value = 1;
	play_speed_run = false;
	prev_speed_run = false;
	end_sound = false;
	prev_end_sound = false;
	decrease_lighting = false;
	swap_room = noone;
}

if(room == game)
{
	var near_beacon = instance_nearest(player.x, player.y, beacon);
	if(near_beacon.lit)
	{
		var crackle_distance = distance(player.x, near_beacon.x, player.y, near_beacon.y);
	}
	else
	{
		var crackle_distance = crackle_range + 1;
	}
	if(crackle_distance > crackle_range)
	{
		audio_sound_gain(fire_crackling, 0, 0);
		if(bird_timer <= 0)
		{
			audio_play_sound(bird_sounds[irandom_range(0, 1)], 1, false);
			bird_timer = room_speed * irandom_range(10, 20);
		}
		else
		{
			bird_timer--;
		}
	}
	else
	{
		audio_sound_gain(fire_crackling, 0.6 * (crackle_range - crackle_distance) / crackle_range, 0);
	}
	
	if(play_speed_run != prev_speed_run)
	{
		if(play_speed_run)
		{
			audio_sound_gain(game_sound, 0, 1000);
			audio_sound_set_track_position(speed_sound, 0);
			audio_sound_gain(speed_sound, 1, 1000);
		}
		else
		{
			audio_sound_gain(speed_sound, 0, 1000);
			audio_sound_set_track_position(game_sound, 0);
			audio_sound_gain(game_sound, 1, 1000);
		}
	}
	
	if(end_sound != prev_end_sound)
	{
		if(end_sound)
		{
			audio_sound_gain(game_sound, 0, 1000);
			audio_sound_set_track_position(menu_sound, 0);
			audio_sound_gain(menu_sound, 1, 1000);
			alarm[0] = audio_sound_length(menu_sound) * room_speed - room_speed;
		}
	}
	if(decrease_lighting)
	{
		light_manager.min_light_value = max(light_manager.min_light_value - (1 / room_speed), 0);
		light_manager.max_light_value = max(light_manager.max_light_value - (1 / room_speed), 0);
		show_debug_message(string(light_manager.max_light_value));
	}
}

prev_speed_run = play_speed_run;
end_sound = prev_end_sound;

