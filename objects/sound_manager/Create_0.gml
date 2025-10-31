menu_sound = audio_play_sound(sn_menu, 1, true);

speed_sound = audio_play_sound(sn_speed_run, 1, true, 0);

fire_crackling = audio_play_sound(sn_fire_crackling, 1, true, 0);

game_sound = audio_play_sound(sn_gameplay, 1, true, 0);

bird_timer = room_speed * irandom_range(10, 20);

bird_sounds = [sn_crows, sn_wings_flapping];

swap_room = noone;
crackle_range = 640;
play_speed_run = false;
prev_speed_run = false;
end_sound = false;
prev_end_sound = false;

decrease_lighting = false;

