//get inputs
up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down); //it's also possible to add wasd commands as well
accept_key = keyboard_check_pressed(vk_space);

//store number of options in print mnu
op_length = array_length(option[menu_level]);

//move throught the menu
pos += down_key - up_key;
if pos >= op_length {pos = 0};
if pos < 0 {pos = op_length-1};


//using the options
if accept_key {
	
	var _sml = menu_level //store the value of the start menu level
switch(menu_level) {
	case 0: //pause menu
		
		switch(pos) {
	
			case 0: //case 0 is starting the game
				room_goto(lab_room);	
				break;
		
			case 1:	//settings
				menu_level = 1;
				break;
		
			case 2: //quit
				game_end();
				break;
				
					}
		break;
				
		//settings
		case 1:
			switch(pos) {
				
				case 0: //window size
				
				break;
				
				case 1: //brightness
				
				break;
				
				case 2: //controls
				
				break;
				
				case 3: //back
				menu_level = 0;
				break;
			}
}


//set position back
if _sml != menu_level {pos = 0};
//correct option length
op_length = array_length(option[menu_level]);
}
