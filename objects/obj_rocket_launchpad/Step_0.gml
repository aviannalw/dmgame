if mouse_check_button_pressed(mb_left)
{  if collision_point(mouse_x, mouse_y, id, true, false)
	{image_index = 2;
	array_delete(inv, 0, 10); //delete player items
	instance_deactivate_object(inst_4670B8EA);
		room_goto(win_room);}
		}

