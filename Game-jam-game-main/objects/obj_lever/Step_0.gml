if(active){image_xscale = 1}else{image_xscale = -1}


if(place_meeting(x,y,obj_player))
{
	active = true;
}
if(place_meeting(x,y,obj_golem))or(place_meeting(x,y,obj_golem_old))
{
	active = false;
}

if(instance_exists(door_id)) 
{
	with(door_id) 
	{
		open = other.active;
	}
}