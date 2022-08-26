function scr_pState_normal(){
	//actually move
	hsp = (horz*spd)+teth_hsp;
	
	//fall down
	vsp += grav;
	
	//throw the tether
	
	//reduce tether momentum to nothing
	var teth_momentum_fall = 0.02;
	teth_hsp = lerp(teth_hsp,0,teth_momentum_fall)
	
	#region jump code
	var sq_max = 1.1;
	var sq_min = 0.8;
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
		
		//make the artifact fall to your level provided you aren't moving
		if(horz == 0)
		{
			if(artifact_y < y+8)
			{
				artifact_y = scr_approach(artifact_y,y+8,2);
			}
		}
		
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
}