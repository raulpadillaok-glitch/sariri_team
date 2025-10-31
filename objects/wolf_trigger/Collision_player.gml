for(var i = 0; i < array_length(eye_coords); i += 2)
{
	instance_create_layer(eye_coords[i], eye_coords[i + 1], "Light", wolf_eyes);
}

alarm[0] = room_speed / 2;

