if(place_meeting(x,y,obj_player))
{
	if(placed_ring)
	{
		placed_ring = false;
		
		with(obj_player){state = pState.LOCKED}
		obj_camera.target = id;
		obj_camera.ratio = 0.5;
		alarm[0] = 120;
	}
}
