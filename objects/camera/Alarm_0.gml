follow_path = true;
path_start(Cam_path, 10, path_action_stop, true);
sound_manager.end_sound = true;
precise = true;

var cam = view_camera[0];
camera_set_view_border(cam, room_width / 2, room_height / 2);

alarm[1] = room_speed;

