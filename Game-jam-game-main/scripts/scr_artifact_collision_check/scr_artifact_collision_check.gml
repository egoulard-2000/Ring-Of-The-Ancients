function scr_artifact_collision_check(){
//check if artifact has collided with something
var h = collision_circle(obj_player.artifact_x,obj_player.artifact_y,sprite_get_width(spr_artifact)/2,obj_art_hit_parent,true,true)
return h
}