if(brazier.unlit)
{
	if(instance_exists(decoy) && decoy.active)
	{
		x = decoy.x;
		y = decoy.y;
	}
	else
	{
		x = player.x;
		y = player.y;
	}

}
else if(!follow_path)
{
	
	direction = point_direction(x, y, brazier.x, brazier.y);
	speed = min(distance(x, brazier.x, y, brazier.y), 4);
	precise = true;
	if(set_alarm)
	{
		alarm[0] = room_speed * 8;
		set_alarm = false;
	}
}

if(precise)
{
	var cam = view_camera[0];
	var width = camera_get_view_width(cam);
	var height = camera_get_view_height(cam);
	camera_set_view_pos(cam, camera.x - width / 2, camera.y - height / 2);
}

