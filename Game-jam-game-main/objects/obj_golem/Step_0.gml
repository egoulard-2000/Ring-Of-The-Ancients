image_xscale = dir;

hsp = dir * spd

vsp += grav

if(place_meeting(x+dir,y,obj_solid))or(place_meeting(x+dir,y,obj_golem_block))
{
	dir *= -1;
}

if(place_meeting(x,y,obj_player))
{
	if(obj_player.hurt_timer == 0)
	{
		obj_player.hp -= 1;
		obj_player.hurt_timer = obj_player.hurt_timer_max
		obj_player.state = pState.HURT
	}
}

#region collision code
if(place_meeting(x+hsp,y,obj_solid))
{
	while(!place_meeting(x+sign(hsp),y,obj_solid))
	{
		x += sign(hsp)
	}
	hsp = 0;
}

if(place_meeting(x+hsp,y,obj_golem_block))
{
	while(!place_meeting(x+sign(hsp),y,obj_golem_block))
	{
		x += sign(hsp)
	}
	hsp = 0;	
}

x+= hsp
if(place_meeting(x,y+vsp,obj_solid))
{
	while(!place_meeting(x,y+sign(vsp),obj_solid))
	{
		y += sign(vsp)
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
