
layer_y(layer_get_id("Background"),camera_get_view_y(cam))
layer_x(layer_get_id("Background"),camera_get_view_x(cam)/25)

if(instance_exists(obj_player))
{
	if(obj_player.state != pState.LOCKED)
	{
		with(obj_player)
		{
			other.target = instance_place(x,y,obj_camera_box);
		}
	}
}

curr_ratio = scr_approach(curr_ratio,ratio,0.2);

//resize camera
camera_set_view_size(cam,cam_width*curr_ratio,cam_height*curr_ratio);

//lock onto target
if(instance_exists(target))
{
	targx = target.x-((cam_width *curr_ratio )/2);
	targy = target.y-((cam_height*curr_ratio )/2);
}

curr_x = scr_approach(curr_x,targx,25);
curr_y = targy

camera_set_view_pos(cam,curr_x,curr_y)


if(keyboard_check_pressed(full_key))
{
	full_scr = !full_scr
	window_set_fullscreen( full_scr )
}



