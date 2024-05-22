depth = -9999 //textbox will show up on top of things

//text box parameters
text_box_width = 256; //change these to change the dimension of the text box
text_box_height = 64;
border = 8; //space from the edges of the box that the text will have
line_sep = 12; //vertical separation between text lines
line_width = text_box_width - border*2;
text_box_spr = spr_text_box;
text_box_img = 0;
text_box_img_spd = 0; //if text box is animated, change this number to frame speed/60, frame speed is in the image editor
text_x_offset = 12;

//added to try and fix text alignment
text_box_spr_w = 0; 
text_box_spr_h = 0;
text_box_x = 0;
text_box_y = 0;
//added to try and fix text alignment

is_typing = false;



//text
page = 0;
page_number = 0; //variables have to be initalized in the create event
text[0] = "";
text_length[0] = string_length(text[0]); //length of array
char[0, 0] = ""; //a two dimensional string array, character number on the page, and the page itself
char_x[0, 0] = 0;
char_y[0, 0] = 0;
draw_char = 0; //how many characters are drawn initially, creates a typewriter effect
text_spd = 1; //going to be added to the draw_char variable
//options
option[0] = ""; //declare the array as a string type
option_link_id[0] = -1;
option_pos = 0;
option_number = 0;


setup = false; //checks if setup has been done, and if not then run the setup code

//sound
snd_delay = 4; //frames to delay
snd_count = snd_delay;

//effects
scr_set_defaults_for_text();
last_free_space = 0; //keeps track of where the last word ends
text_pause_timer = 0;
text_pause_time = 16;

//trying to get only one text box to appear
exists = false;