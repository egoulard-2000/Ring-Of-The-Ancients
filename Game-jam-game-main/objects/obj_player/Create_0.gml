/// @description Init variables

key_left = ord("A")
key_right = ord("D")
key_jump = vk_space
key_throw = undefined

//health variables
hp = 3;

//squash and stretch
squashed = true;
xscale = 1;
yscale = 1;
xscale_targ = 1;
yscale_targ = 1;

//gravity and jumping
grav = 0.08
jumpspd = -3.5;

use_var_jumps = false;
jumps = 1;
spd = 3;

hsp = 0;
vsp = 0;
//tether momentum keep
teth_hsp = 0;
teth_vsp = 0;
w_accel = 0;

//get hurt
hurt_timer = 0;
hurt_timer_max = 60;

alph = 0;

//throw it
teth_targ = [x,y];

state = pState.NORMAL

enum pState 
{
	NORMAL,
	THROW,
	SWING,
	HURT,
	LOCKED
}

artifact_x = x;
artifact_y = y;

image_speed = 0
image_index = 0;
