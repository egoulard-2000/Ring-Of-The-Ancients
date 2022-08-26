
view_enabled = true;
view_visible[0] = true;

window_set_size(win_width,win_height);

camera_set_view_size(cam,cam_width,cam_height);

display_set_gui_size(cam_width,cam_height)
surface_resize(application_surface,cam_width,cam_height)

if(instance_exists(target))
{
	camera_set_view_pos(cam,target.x-(cam_width/2), target.y-(cam_height/2))
}

curr_x = 0;
curr_y = 0;
targx = 0;
targy = 0;

ratio = 1;
curr_ratio = 1;

