 
if is_typing == false 
&& ( position_meeting(mouse_x, mouse_y, id) && (mouse_check_button_pressed(mb_left)) ) //if hovering and clicked on
|| ( distance_to_object(obj_player_ram) < 20 && keyboard_check_pressed(ord("E")) && obj_speak_block.is_typing == false) //if close and press E
{
	create_text_box(text_id); //this function comes from the text box function script and game text
	is_typing = true; //make mouse input not spawn another instance of the text boxes :)
}

