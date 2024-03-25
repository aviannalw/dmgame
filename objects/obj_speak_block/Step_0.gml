if position_meeting(mouse_x, mouse_y, id) && mouse_check_button_pressed(mb_left) //if hovering and clicked on
{
	with( instance_create_depth(0, 0, -9999, obj_text_box) )	
	{
		scr_text("who, me?");
		scr_text("wow buddy nice one");
	}
}

