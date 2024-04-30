
accept_key = keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left); //could also set to a specific key ( ord("E") )
is_typing = false;
text_box_x = camera_get_view_x(view_camera[0]);//we're placing the text box
text_box_y = camera_get_view_y(view_camera[0]) + 144; //dialogue box will be 12 px from the top

//----------------------------------------setup code--------------------------------------------//
if setup == false
	{
		setup = true;
		draw_set_font(fnt_iconic);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left); //sets the vertical and horizontal alignment of the text
		
//loop through the pages
	for(var p = 0; p < page_number; p++) //if the length of the page number is less than p, add 1
	{
				//find how many characters are on each page and store that number in the text_length array
				text_length[p] = string_length(text[p]);
				//get the x position for the text box
					//no character (center the textbox)
				text_x_offset[p] = 12; //distance from the left side of the screen that the text box is
				
				//loop through all of the characters on the page
		for (var c = 0; c < text_length[p]; c++) //goes through each character, text length of the page that we're on, sets individual characters and finds where the lines of text should break
		{ //string arrays start at 1 instead of 0
					var _char_pos = c+1;
					//store indivudual characters in the char array
					char[c, p] = string_char_at(text[p], _char_pos);
					
					//get current width of the line, find the line breaks!
					var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
					var _current_text_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
					//get the last free space
					if char[c, p] == " " {last_free_space = _char_pos+1 };
					//track where the line breaks need to happen, get the line breaks
					if _current_text_w - line_break_offset[p] > line_width //check if the width of the line of the character we're at is above the line width, and if so then add a break
					{
						line_break_pos[line_break_num[p], p] = last_free_space; //line break num keeps track of every line break for every page, first line break position will be set to the last free space instead of cutting words up
						line_break_num[p]++;
						var _txt_up_to_last_space = string_copy(text[p], 1, last_free_space);
						var _last_free_space_string = string_char_at(text[p], last_free_space);
						line_break_offset[p] = string_width(_txt_up_to_last_space) - string_width(_last_free_space_string);
					}
					
		}
				
			//getting each character's coordinates
			for (var c = 0; c < text_length[p]; c++)
				{
				var _char_pos = c+1;	
				var _txt_x = text_box_x + text_x_offset[p] = border;
				var _txt_y = text_box_y + border;
				//get current width of the line
				var _txt_up_to_char = string_copy(text[p], 1, _char_pos);
				var _current_text_w = string_width(_txt_up_to_char) - string_width(char[c, p]);
				var _txt_line = 0; //figure out how many lines there are, use it as a multiplier
				
				//compensate for line breaks
				for (var lb = 0; lb < line_break_num[p]; lb++) //lb means line break, loops through how many line breaks we have on this page
				{
				//if the current looping character is after a line break
				if _char_pos >= line_break_pos[lb, p] //basically if the line is broken, both the x and y values need to change for the coordinates
					{
						var _str_copy = string_copy(text[p], line_break_pos[lb, p], _char_pos - line_break_pos[lb, p] );
						_current_text_w = string_width(_str_copy);
						
						//record the line this character should be on
						_txt_line = lb+1; // +1 since lb starts at 0
					}
				}
				
					//add to the x and y coordinates based on the new info
					char_x[c, p] = _txt_x + _current_text_w;
					char_y[c, p] = _txt_y + _txt_line*line_sep;
				}
			
			}
	}
	
//--------------------------------------------------------typing the text----------------------------------------------------------//
if text_pause_timer <= 0
{
		if draw_char < text_length[page]
			{
				draw_char += text_spd; //creates typing effect
				draw_char = clamp(draw_char, 0, text_length[page]); //clamping means that you restirict a min and max
				//check that we are at punctuation, we're going to add natural pauses
				var _check_char = string_char_at(text[page], draw_char);
				if _check_char == "." || _check_char == "!" || _check_char == "?" || _check_char == "," // || is the or operator
					{
						text_pause_timer = text_pause_time;
						audio_stop_sound(snd[page]);
						if !audio_is_playing(snd[page]) { audio_play_sound(snd[page], 8, false);}
					} else {
					//typing sound
						if snd_count < snd_delay {
							snd_count++;
							} else {
								snd_count = 0;
								audio_play_sound(snd[page], 8, false); //priority is the precednet of what sounds come on top of other ones
								//audio_stop_sound(snd[page]);
								}
						}
			}
}	 else {
	text_pause_timer --;
}
//----------------------------------------------------flip through pages---------------------------------------------------------//

if accept_key //if spacebar is pressed...
	{
		obj_player_ram.movespeed = 0;
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
						//link text for options
						if option_number > 0
						{
							create_text_box(option_link_id[option_pos]);
						}
						instance_destroy();
					}
		}
		// if not done typing, spacebar fills out the page of text
		else
			{
				draw_char = text_length[page];
			}
	}

//------------------------------------------------draw the textbox---------------------------------------------//
//	obj_player_ram.current_state = move_state.FREEZE;
	//i think these four lines are redundant
	draw_set_font(fnt_font_zig);
	draw_set_color(c_white);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	var _text_box_x =  text_box_x + text_x_offset[page];
	var _text_box_y = text_box_y;
	text_box_img += text_box_img_spd; //has to do with animation, which i don't have
	text_box_spr_w = sprite_get_width(text_box_spr);
	text_box_spr_h = sprite_get_height(text_box_spr);
	//back of the textbox
	draw_sprite_ext(text_box_spr, text_box_img, _text_box_x, _text_box_y, text_box_width/text_box_spr_w, text_box_height/text_box_spr_h, 0, c_white, 1);
	
// ------------------options! should appear on the last page of the dialogue, ready for the user to make a choice--------------------//
if (draw_char == text_length[page]) && (page == page_number -1) //if we're on the final page...
{
	
		//option selection
		option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
		option_pos = clamp(option_pos, 0, option_number -1); //possible to loop through options as well, not coded here
		
	
		//draw the options
		var _op_space = 24; //i'll have to mess around with these values, vertical distance between options
		var _op_bord = 8; // text space from sides of box
		for (var op = 0; op < option_number; op++) //looping through the options
		{
			//the option box
			var _o_w = string_width(option[op]) + _op_bord*2;//option width shoudl be dynamic
			draw_sprite_ext(text_box_spr, text_box_img, _text_box_x + 16, _text_box_y - _op_space*option_number + _op_space*op, _o_w/text_box_spr_w, (_op_space - 1)/text_box_spr_h, 0, c_white, 1); //options will appear in the order we want them to with a little x offset
			//the arrow
			if option_pos == op
				{
					draw_sprite(spr_arrow, 0, _text_box_x, _text_box_y - _op_space*option_number + _op_space*op);
				}
			
			//the option text
			//compare this code to what's going on with the normal text box and typing
			draw_text(_text_box_x + 16 + _op_bord, _text_box_y - _op_space*option_number + _op_space*op + 2, option[op]);
		}
}
	
	//draw the text
for (var c = 0; c < draw_char; c++)
{
	// creates a square cursor target draw_text(mouse_x, mouse_y, char[c, page]);
//	draw_text(char_x[c, page] + text_box_spr_w/2, char_y[c, page] + text_box_spr_h/2, char[c, page]);
	draw_text_ext(text_box_x + text_x_offset[page] + border, text_box_y + border, string_copy(text[page], 1, draw_char), line_sep, line_width);
//i think i need to do something with the viewport here
	
}

