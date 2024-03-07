//this code only runs when the animation is over
		room_goto(target_rm);
		obj_player_ram.x = target_x;//the dot references a variable that the bigram already has
		obj_player_ram.y = target_y;
		obj_player_ram.face = target_face;

image_speed = -1; //how fast the animation is playing, means it will start animating backwards