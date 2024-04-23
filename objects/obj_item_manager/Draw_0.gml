draw_set_font(fnt_iconic);

for ( var i = 0; i < array_length(inv); i++)
{
	var _xx = camera_get_view_x(view_camera[0]) +screen_bord;
	var _yy = camera_get_view_y(view_camera[0])+screen_bord;
	var _sep = sep; //separation between items
	var _col = c_white; //used for an indicator that we've selected an item
draw_sprite(inv[i].sprite, 0, _xx + _sep*i, _yy ); //if you need to reference the struct in a different place, do obj.item_manager.global.item_list.rocket_piece.sprite
//this would be really helpful for drawing lives remaining, since they remain persistent across screens.


if selected_item == i {_col = c_yellow;} //so we can tell the item we've selected is selected
draw_set_color(_col);
//draw_rectangle_color()//make a rectangle go around the spite when selected bruh


// draw_text(_xx + 16, _yy + _sep*i, inv[i].name);
//i made the name not appear when an item is picked up

//draw descriptipn
if selected_item == i
{
draw_text_ext(_xx + 16, _yy + _sep*array_length(inv), inv[i].description, 12, 80); //this makes description underneath the items, I'd like to change it to a horizontal layout though
}
draw_set_color(c_white); //resets the color back to white so we don't mess up the game
}

if has_pi_paper = true {
		draw_sprite_ext(spr_pi_paper_full, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, 1);
		if mouse_check_button_pressed(mb_left)
		{instance_deactivate_region(20, 20, 200, 200, true, true);}
		
}
	
