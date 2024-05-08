//get selected item
//means to get where you are in the array
selected_item = -1;
for ( var i = 0; i < array_length(inv); i++)
{
	var _xx = camera_get_view_x(view_camera[0]) +screen_bord + sep*i; //separation between items
	var _yy = camera_get_view_y(view_camera[0])+screen_bord; 

//x and y position checks for the mouse to select an item
if mouse_x > _xx && mouse_x < _xx+8 && mouse_y > _yy && mouse_y < _yy+8  //8 has to do with the width of the sprite, basically this makes a hitbox for the sprite so we can click on it
	{
		selected_item = i;
		selected = true;
		
	} else {selected = false;}

//i am abandoning the inventory controls with anythign other than the mouse because i could not get it to work and i tried for 3 hours :)
//	if keyboard_check_pressed(ord(string(i+1))) {selected = !selected;}
//if keyboard_check_pressed(ord("I"))
//	{selected_item = i++;}


//useful to make the selected item effect happen
if selected_item != -1 //makes sure something is selected
{
	//use an item with the effect
	if mouse_check_button_pressed(mb_left) 
	|| ( (keyboard_check_released(ord("E"))) && selected_item != global.item_list.blueprint && selected_item != global.item_list.pi_paper )//could also use keyboard
		{
			inv[selected_item].effect(); //does the effect
		}
		//drop the item
	if mouse_check_button_pressed(mb_right) && inv[selected_item].can_drop == true // could also use the keyboard
	{array_delete(inv, selected_item, 1);} //get rid of the item only if it's a droppable item
}

}