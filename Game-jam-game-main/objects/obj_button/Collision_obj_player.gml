/// @description Insert description here
// You can write your code in this editor
if(image_index == 0) {
	image_index = 1
	if(instance_exists(door_id)) 
	{
		with(door_id) 
		{
			open = other.image_index;
		}
	}
}