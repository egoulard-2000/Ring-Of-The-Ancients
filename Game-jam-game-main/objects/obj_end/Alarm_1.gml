if(room_exists(room_to_go))
{
	with(instance_create_depth(0,0,-999,obj_transitioner)){
		room_to_go_to = other.room_to_go
	}
}