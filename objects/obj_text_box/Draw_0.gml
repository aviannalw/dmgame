accept_key = keyboard_check_pressed(vk_space); //could also set to a specific key ( ord("E") )

text_box_x = camera_get_view_x(view_camera[0]);//we're placing the text box
text_box_y = camera_get_view_y(view_camera[0]) + 144; //dialogue box will be 12 px from the top

//setup code
if setup == false
	{
		setup = true;
		draw_set_font(fnt_font_zig);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left); //sets the vertical and horizontal alignment of the text
		
		//loop through the pages
		page_number = array_length(text); //number of pages in the text box
		for(var p =0; p < page_number; p++) //if the length of the page number is less than p, add 1
			{
				//find how many characters are on each page and store that number in the text_length array
				text_length[p] = string_length(text[p]);
				//get the x position for the text bos
					//no character (center the textbox)
				text_x_offset[p] = 44; //distance from the left sde of the screen that the text box is
			}
	}
	
//typing the text
if draw_char < text_length[page]
	{
		draw_char += text_spd; //creates typing effect
		draw_char = clamp(draw_char, 0, text_length[page]); //clamping means that you restirict a min and max
	}
	
//flip through pages
if accept_key //if spacebar is pressed...
	{
		//if the typing is done, go to next page
		if draw_char == text_length[page] //page has been fully typed
		{
			//next page
			if page < page_number-1 //page number returns the full value of the number of text pages, have to minus one becuase the array starts at 0
				{
					page++;
					draw_char = 0;
				}
				else //destroy text box after all pages have been read
					{
						instance_destroy();
					}
		}
		// if not done typing, spacebar fills out the page of text
		else
			{
				draw_char = text_length[page];
			}
	}
	//draw the textbox
	text_box_img += text_box_img_spd; 
	text_box_spr_w = sprite_get_width(text_box_spr);
	text_box_spr_h = sprite_get_height(text_box_spr);
	//back of the textbox
	draw_sprite_ext(text_box_spr, text_box_img, text_box_x + text_x_offset[page], text_box_y, text_box_width/text_box_spr_w, text_box_height/text_box_spr_h, 0, c_white, 1);
	//draw the text
	var _drawtext = string_copy(text[page], 1, draw_char);
	draw_text_ext(text_box_x + text_x_offset[page] + border, text_box_y + border, _drawtext, line_sep, line_width); //breaks lines