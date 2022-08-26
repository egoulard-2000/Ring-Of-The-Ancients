function scr_pState_throw(){
	//actually move
	hsp = (horz*spd)+teth_hsp;
	
	//fall down
	vsp += grav;
	
	//throw the tether
	
	//reduce tether momentum to nothing
	var teth_momentum_fall = 0.02;
	teth_hsp = lerp(teth_hsp,0,teth_momentum_fall)
	
	#region jump code
	var sq_max = 1.7;
	var sq_min = 0.7;
	if(place_meeting(x,y+1,obj_solid) && jumps > 0)
	{
		teth_hsp = 0;
		use_var_jumps = false;
		if(keyboard_check_pressed(key_jump))
		{
			use_var_jumps = true;
			vsp = jumpspd;
			jumps -= 1;
		}
		jumps = 1;
		
		//squash down only when you hit the ground
		if(squashed){xscale_targ = sq_max; yscale_targ = sq_min;squashed = false}
		if(xscale == xscale_targ)and(yscale = yscale_targ){xscale_targ = 1; yscale_targ = 1;}
		
		//squash and stretch
		var sq_rate = 0.8
		xscale = lerp(xscale,xscale_targ,sq_rate)
		yscale = lerp(yscale,yscale_targ,sq_rate)
	}else{
		//squash and stretch
		var squash_range = 1.5;
		if(vsp < -squash_range)or(vsp > squash_range) {xscale_targ = sq_min; yscale_targ = sq_max;}else{xscale_targ = 1; yscale_targ = 1;}
		squashed = true;
		
		//squash and stretch
		var sq_rate = 0.2
		xscale = lerp(xscale,xscale_targ,sq_rate)
		yscale = lerp(yscale,yscale_targ,sq_rate)
		
		//varaible jump stuffs
		if(use_var_jumps)
		{
			if (vsp < 0) and (!jumpHold) {
				vsp = max(vsp, -jumpspd/2);
			}
		}
	}
	#endregion
	
	
	//actually throw the artifact
	var dir = point_direction(artifact_x,artifact_y,teth_targ[0],teth_targ[1])
	
	var teth_spd = 4;
	
	//move toward x
	if (artifact_x < teth_targ[0])
    {artifact_x = min(artifact_x + lengthdir_x(teth_spd,dir), teth_targ[0]);}
	else {artifact_x = clamp(artifact_x,teth_targ[0],artifact_x + lengthdir_x(teth_spd,dir));}
	
	//move toward y
	if (artifact_y < teth_targ[1])
    {artifact_y = min(artifact_y + lengthdir_y(teth_spd,dir), teth_targ[1]);}
	else {artifact_y = max(artifact_y + lengthdir_y(teth_spd,dir), teth_targ[1]);}
}