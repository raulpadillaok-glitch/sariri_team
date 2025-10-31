my_light = noone;
emitter = noone;

if(lit)
{
	my_light = instance_create_layer(x, y, "Light", light);
	my_light.red = colour_get_red(colour) / 255;
	my_light.green = colour_get_green(colour) / 255;
	my_light.blue = colour_get_blue(colour) / 255;
	my_light.strength = 1;
	my_light.range = 640;
	
	ps = fire_part.ps;
	
	type = part_type_create();
	part_type_colour3(type, c_yellow, c_orange, c_red);
	part_type_speed(type, 1, 1.5, 1, .1);
	part_type_direction(type, 60, 120, 0, 8);
	part_type_sprite(type, spr_fire_part, false, false, false);
	part_type_size(type, 3, 4, -.3, .1);
	part_type_life(type, 7, 9);
	
	emitter = part_emitter_create(ps);
	part_emitter_region(ps, emitter, x - 8, x + 8, y - 24, y - 20, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_stream(ps, emitter, type, 1);
}

set_lit = function()
{
	if(instance_exists(spark) && instance_place(x, y, spark))
	{
		lit = true;
	}
}

save_game = function()
{
	for(var i = 0; i < instance_number(torch); i++)
	{
		ds_map_set(game_manager.torch_states, string(instance_find(torch, i)), instance_find(torch, i).lit);
	}
	for(var i = 0; i < instance_number(knight); i++)
	{
		ds_map_add(game_manager.enemy_positionsx, string(instance_find(knight, i).id), instance_find(knight, i).x);
		ds_map_add(game_manager.enemy_positionsy, string(instance_find(knight, i).id), instance_find(knight, i).y);
	}
	game_manager.previous_beacon = self;
}

