Health -= other.damage / room_speed;
if(oof_timer <= 0 && spawn_dead)
{
	audio_play_sound(oof_sounds[irandom_range(0, 3)], 1, false);
	oof_timer = room_speed / 2;
}

