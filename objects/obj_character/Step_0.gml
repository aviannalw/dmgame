//alarm goes off when the player reaches a certain point on the map , player pauses, npc moves to a certain point and starts talking to the player

 /* if distance_to_object(obj_player_ram) < 25 && i < 60
 {
	obj_player_ram.speed = 0;
	move_towards_point(330, 563, 3);
	i++;
	}
 else speed = 0;       */
 //i think I would rather have the player click on or run into something that makes this character speak
 
 if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) //if hovering and clicked on
{
	create_text_box(text_id); //this function comes from the text box function script and game text
}
