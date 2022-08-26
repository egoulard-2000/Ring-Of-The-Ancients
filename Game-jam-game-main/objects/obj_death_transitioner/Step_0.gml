
pos += 0.03
amount = animcurve_channel_evaluate(animcurve_get_channel(anim_transition, "curve1"),pos);

if(amount == clamp(amount,0.4,0.5))&&(transition)
{
	room_goto(death_room)
	room_goto(room_to_go_to)
	transition = false;
}

if(pos >= 1){instance_destroy();}
