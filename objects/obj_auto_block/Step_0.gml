/*if hit = 0 {
	create_text_box(text_id); //this function comes from the text box function script and game text
hit =1;
} */
/*
if position_meeting(obj_player_ram.x, obj_player_ram.y, id)
{
	create_text_box(text_id); //this function comes from the text box function script and game text
	

}
*/ 
if point_distance(id.x, id.y, obj_player_ram.x, obj_player_ram.y) > 35
	{instance_activate_object(id);}