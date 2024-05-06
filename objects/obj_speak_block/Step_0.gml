 
if is_typing == false && position_meeting(mouse_x, mouse_y, id) &&( mouse_check_button_pressed(mb_left) || place_meeting(obj_player_ram.x, obj_player_ram.y, id) )//if hovering and clicked on
{
	create_text_box(text_id); //this function comes from the text box function script and game text
	is_typing = true; //make mouse input not spawn another instance of the text boxes :)
}

