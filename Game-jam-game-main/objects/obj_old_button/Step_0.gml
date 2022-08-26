/// @description Insert description here
// You can write your code in this editor
<<<<<<< Updated upstream
//check if the ring is hitting a button
var b = scr_artifact_collision_check();
while(instance_exists(b) && active == false)
{
	active = true
	if(b.object_index == obj_old_button)
	{
		image_index = 1;
	}
}
=======
if(place_meeting(x,y,obj_player) && scr_artifact_collision_check())
{
	image_index = 1;
}

>>>>>>> Stashed changes
if(instance_exists(door_id)) 
{
	with(door_id) 
	{
		open = other.image_index;
	}
}

<<<<<<< Updated upstream
image_index = 0
=======
image_index = 0;
>>>>>>> Stashed changes
