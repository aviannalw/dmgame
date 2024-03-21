//text box parameters
text_box_width = 252; //change these to change the dimension of the text box
text_box_height = 64;
border = 8; //space from the edges of the box
line_sep = 12; //vertical separation between text lines
line_width = text_box_width - border*2;


//text
page = 0;
text[0] = "";//a string array
text_length[0] = string_length(text[0]); //length of array
draw_char = 0; //how many characters are drawn initially, creates a typewriter effect
text_spd = 1;


setup = false;