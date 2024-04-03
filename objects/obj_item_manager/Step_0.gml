//get selected item
//means to get where you are in the array
selected_item = -1;
for ( var i = 0; i < array_length(inv); i++)
{
	var _xx = camera_get_view_x(view_camera[0]) +screen_bord;
	var _yy = camera_get_view_y(view_camera[0])+screen_bord + sep*i; //separation between items

//x and y position checks for the mouse to select an item
if mouse_x > _xx && mouse_x < _xx+8 && mouse_y > _yy && mouse_y < _yy+8 //8 has to do with the width of the sprite, basically this makes a hitbox for the sprite so we can click on it
	{
		selected_item = i;
	}
}

//useful to make the selected item effect happen
if selected_item != -1 //makes sure something is selected
{
	//use an item with the effect
	if mouse_check_button_pressed(mb_left) //could also use keyboard
		{
			inv[selected_item].effect(); //does the effect
		}
}