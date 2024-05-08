draw_set_font(fnt_iconic);

for ( var i = 0; i < array_length(inv); i++)
{
	var _xx = camera_get_view_x(view_camera[0]) +screen_bord;
	var _yy = camera_get_view_y(view_camera[0])+screen_bord;
	var _sep = sep; //separation between items
	var _col = c_white; //used for an indicator that we've selected an item
draw_sprite(inv[i].sprite, 0, _xx + _sep*i, _yy ); //if you need to reference the struct in a different place, do obj.item_manager.global.item_list.rocket_piece.sprite
//this would be really helpful for drawing lives remaining, since they remain persistent across screens.


if selected_item == i
{	_col = c_yellow;
	draw_rectangle_color(_xx - 1 + (_sep*i), _yy - 1, _xx + 9 + (_sep*i), _yy + 9, c_yellow, c_yellow, c_yellow, c_yellow, true);
	} //so we can tell the item we've selected is selected
draw_set_color(_col);

//make a rectangle go around the spite when selected


//draw title and descriptipn
if selected_item == i
{
	
	draw_set_font(fnt_iconic_sm);//draw a shadow text underneath
	draw_set_color(c_black);
		draw_text(_xx +1, _yy + _sep + 9, inv[i].name);
		draw_set_color(c_white);
	draw_text(_xx, _yy + _sep + 8, inv[i].name); //title
		//the name appears when an item is picked up
draw_set_color(c_black);
draw_text_ext(_xx+1, _yy + _sep + 25, inv[i].description, 12, 64);
draw_set_color(c_white);
draw_text_ext(_xx, _yy + _sep + 24, inv[i].description, 12, 64); //this makes description underneath the items, I'd like to change it to a horizontal layout though
}
draw_set_color(c_white); //resets the color back to white so we don't mess up the game
}

if has_pi_paper = true { //view the pi paper
		draw_sprite_ext(spr_pi_paper_full, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, 1);
		if mouse_check_button_released(mb_left)
		{has_pi_paper = false;}
		
}

if has_blueprint = true {
		draw_sprite_ext(spr_rocket_blueprint, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]), 1, 1, 0, c_white, 1);
		if mouse_check_button_released(mb_left)
		{has_blueprint = false;}
		
}
	
