if(speak > 0)
{
	var cam = view_camera[0];
	var width = camera_get_view_width(cam);
	var camx = camera_get_view_x(cam);
	var camy = camera_get_view_y(cam);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_set_colour(#FFF568);
	draw_set_font(bold_font);
	draw_text(camx + width / 2, camy + 32, string_hash_to_newline(dialogue));
	draw_set_colour(c_white);
	speak--;
}
else
{
	if(distance(x, player.x, y, player.y) <= speak_dist)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		draw_set_font(regular_font);
		draw_text(player.x + 32, player.y - 32, interact_string);
		if(keyboard_check_pressed(ord("E")))
		{
			dood_dialogue.speak = 0;
			
			speak = room_speed * 5;
			
			switch(unlock_spell)
			{
				case "spark":
					player.can_spark = true;
				break;
				case "dash":
					player.can_dash = true;
				break;
				case "fire":
					player.can_fire = true;
				break;
				case "decoy":
					player.can_decoy = true;
				break;
			}
		}
	}
}	

