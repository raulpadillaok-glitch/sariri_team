active_distance = 160;
spd = 8;
damage = 20;
targetx = x;
targety = y;
charge = false;
hey_sounds = [sn_hey1, sn_hey2];

ds_map_add(game_manager.enemy_positionsx, string(id), x);
ds_map_add(game_manager.enemy_positionsy, string(id), y);