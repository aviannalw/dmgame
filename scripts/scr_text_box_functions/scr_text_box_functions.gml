function scr_set_defaults_for_text () {
	line_break_pos[0, page_number] = 999; //stores what position the text should move onto the next line for line breaks
	line_break_num[page_number] = 0; //keeps tracks of number of line breaks we have while we are looping through the pages
	line_break_offset[page_number] = 0; //keeps track of width in pixels that we need to reset each character's position
	//a sound function 
	//snd[page_number] = audio_sound_pitch(snd[page], random_range(0.8, 1.2));
}

/// @param text
function scr_text(_text){
	
	scr_set_defaults_for_text ();
	
	text[page_number] = _text;
	
	page_number ++;

}

/// @param option
///@ param link_id
function scr_option(_option, _link_id) {
	
	option[option_number] = _option;
	option_link_id[option_number] = _link_id;
	option_number++;
	
}


/// @param text_id
function create_text_box(_text_id) {
	
	with( instance_create_depth(0, 0, -9999, obj_text_box) )	
	{
		scr_game_text(_text_id);
	}
}