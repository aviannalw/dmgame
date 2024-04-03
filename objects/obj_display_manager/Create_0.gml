alarm[0] = room_speed * 2;
//display properties
ideal_width = 0;
ideal_height = 256; //i'll have to mess around with this
aspect_ratio = display_get_width()/display_get_height();

//keeps the height static
ideal_width = round(ideal_height* aspect_ratio);
//or to keep the widt static, ideal_height = round(ideal_width*aspect_ratio);

//check for odd numbers, since that's bad
if (ideal_width & 1)
	{
		ideal_width++;
	}

//set up the view for every room
for (var i =1; i <= room_last; i++)
{
	if(room_exists(i))
	{
		room_set_viewport(i, 0, true, 0, 0, ideal_width, ideal_height) //this is a different function to what i found in an old tutorial, hope it works	
		room_set_view_enabled(i, true);
	}
}

//resize the application surface to match the ideal resolution
surface_resize(application_surface, ideal_width, ideal_height);
window_set_size(ideal_width, ideal_height);

//now start the game on the first room
// room_goto(room_next(room));
//i took this out so I could put the object on the menu screen