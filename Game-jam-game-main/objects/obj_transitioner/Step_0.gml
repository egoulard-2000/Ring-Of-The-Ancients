
pos += 0.01
amount = animcurve_channel_evaluate(animcurve_get_channel(anim_transition, "curve1"),pos);

if(amount == clamp(amount,0.5,0.6))&&(room_exists(room_to_go_to))
{
	if(room != room_to_go_to)
	{
		room_goto(room_to_go_to)
	}
}
if(pos >= 1){instance_destroy();}
