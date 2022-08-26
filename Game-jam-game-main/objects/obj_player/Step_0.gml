//find hsp based on inputs
horz = keyboard_check(key_right)-keyboard_check(key_left)
jumpHold = keyboard_check(key_jump)

mousePressed = mouse_check_button_pressed(mb_left)
mouseReleased = mouse_check_button_released(mb_left)

//die
if(hp <= 0){if(state != pState.LOCKED){state = pState.LOCKED; instance_create_layer(0,0,layer,obj_death_transitioner)}}

//flip sprite
if(horz != 0)
{
	image_xscale = horz;
}

//decrement hurt timer
hurt_timer = clamp(hurt_timer-1,0,hurt_timer_max);
if(hurt_timer == 0){alph = 0}else{
	alph = scr_blink_value(0,1,0.05)
}

switch(state)
{
	case pState.HURT:
	if(hurt_timer == 0){state = pState.NORMAL}
	case pState.NORMAL:
	scr_pState_normal();
	
	//switch states
	if(mousePressed)
	{
		state = pState.THROW;
		teth_targ = [mouse_x,mouse_y]
		artifact_x = x;
		artifact_y = y;
	}
	
	break;
	break;
	
	case pState.THROW:
	
	//check if the ring is hitting the enemy
	var g = scr_artifact_collision_check();
	if(instance_exists(g))
	{
		if(g.object_index == obj_golem)or(g.object_index == obj_golem_old)
		{
			with(g){
				instance_destroy();
			}
		}
	}
	
	scr_pState_throw()
	
	//exit the state by hitting a hook
	var inst = scr_artifact_collision_check();
	if(instance_exists(inst))&&(inst.object_index == obj_hooks)
	{
		state = pState.SWING
		ropeX = x
		ropeY = y
		tetherX = inst.x
		tetherY = inst.y
		ropeAngle = point_direction(tetherX, tetherY, x, y)
		ropeLength = distance_to_point(tetherX, tetherY)
		ropeAngleVelocity = 0
	}
	
	//exit the state by releasing mouse or the artifact getting too far away
	if(mouseReleased)||(point_distance(x,y,artifact_x,artifact_y) >= 55*2)
	{
		state = pState.NORMAL;
	}
	break;
	
	case pState.SWING:
	image_index = 0;
	image_speed = 0;
	scr_pState_swing();
	break
	
	case pState.LOCKED:
	hsp = 0
	vsp = 0;
	//I'll use this later for death code stuffs. for now ignore it
	break;
}

//check if the ring is hitting a button
var b = scr_artifact_collision_check();
if(instance_exists(b))
{
	if(b.object_index == obj_button)or(b.object_index == obj_spring_button)//or(b.object_index == obj_old_button)
	{
		with(b){
			image_index = 1;
		}
	}
}

#region collision code
if(place_meeting(x+hsp,y,obj_solid))
{
	while(!place_meeting(x+sign(hsp),y,obj_solid))
	{
		x += sign(hsp)
	}
	if(state == pState.SWING)
	{
		ropeAngle = point_direction(tetherX,tetherY,x,y);
		ropeAngleVelocity = 0
	}
	hsp = 0;
	teth_hsp = 0;
}
x+= hsp
if(place_meeting(x,y+vsp,obj_solid))
{
	while(!place_meeting(x,y+sign(vsp),obj_solid))
	{
		y += sign(vsp)
	}
	if(state == pState.SWING)
	{
		ropeAngle = point_direction(tetherX,tetherY,x,y);
		ropeAngleVelocity = 0
	}
	vsp = 0;
}
y+= vsp;

//if inside a solid
while(place_meeting(x,y,obj_solid))
{
	x-=1;
}

#endregion

#region animation code
if(hsp < 0) 
{
	image_speed = 1
}
else if(hsp > 0)
{
	image_speed = 1
}
else {
	image_index = 1
	image_speed = 0
}
#endregion