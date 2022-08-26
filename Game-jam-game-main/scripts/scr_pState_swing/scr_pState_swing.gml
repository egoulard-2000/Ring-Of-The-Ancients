function scr_pState_swing(){
	#region swing
	var ropeAngle_accel = -0.2 * dcos(ropeAngle)
	
	//no squash and stretch
	xscale = 1;
	yscale = 1;
	
	//move along the rope
	ropeAngle_accel += horz * 0.06
	
	ropeAngleVelocity += ropeAngle_accel
	ropeAngle += ropeAngleVelocity
	ropeAngleVelocity *= 0.99
	ropeX = tetherX + lengthdir_x(ropeLength, ropeAngle)
	ropeY = tetherY + lengthdir_y(ropeLength, ropeAngle)
	
	hsp = ropeX - x;
	vsp = ropeY - y;
	teth_hsp = hsp;
	
	//draws the effect
	artifact_x = tetherX;
	artifact_y = tetherY;
	
	if(mouseReleased)
	{
		state = pState.NORMAL
		vsp = max(ropeY - y, -5);
		use_var_jumps = false;
	}
	
	#endregion
	

}