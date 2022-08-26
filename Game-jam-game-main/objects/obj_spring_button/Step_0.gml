
if(place_meeting(x,y,obj_player))
{
	image_index = 1;
}

if(instance_exists(door_id)) 
{
	with(door_id) 
	{
		open = other.image_index;
	}
}

image_index = 0;
