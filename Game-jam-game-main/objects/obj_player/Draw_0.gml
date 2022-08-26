/// @description draw things, such as player sprite and artifact

//draw tether bit
if(state != pState.LOCKED)
{
draw_set_color(c_white)
var xx = lengthdir_x(sprite_get_width(spr_artifact)/2,point_direction(x,y,artifact_x,artifact_y))
var yy = lengthdir_y(sprite_get_width(spr_artifact)/2,point_direction(x,y,artifact_x,artifact_y))
draw_line(x,y,artifact_x-xx,artifact_y-yy)
}

//draw self but waaaayyyyyy more complicated then it has to be
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*xscale,image_yscale*yscale,image_angle,image_blend,image_alpha-alph)

//draws a visual effect of the artifact
if(state == pState.NORMAL)
{
	var tether_length = 55;
	if(distance_to_point(artifact_x,artifact_y)>tether_length)
	{
		while(distance_to_point(artifact_x,artifact_y)>tether_length)
		{
			var art_dir = point_direction(artifact_x,artifact_y,x,y)
			artifact_x += lengthdir_x(1,art_dir)
			artifact_y += lengthdir_y(1,art_dir)
		}
	}
}

if(state != pState.LOCKED)
{
	draw_sprite(spr_artifact,0,artifact_x,artifact_y)
}