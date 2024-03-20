width = 64;
height = 104;



op_border = 8; //this is the distance the text is from the side of the text box
op_space = 16; // this is the distance between differnt option

pos = 0; //vairbale used to highlight and select options
//pause menu
option[0, 0] = "Start Game";
option[0, 1] = "Settings";
		//settings menu inside pause menu
		option[1, 0] = "Window Size";
		option[1, 1] = "Brightness";
		option[1, 2] = "Controls";
		option[1, 3] = "Back";
option[0, 2] = "Quit Game";


op_length = 0; //keeps track of how many things are in the options list
menu_level = 0;