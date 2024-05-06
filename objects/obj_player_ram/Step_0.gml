if lives <= 0 && !audio_is_playing(snd_game_over)	{audio_play_sound(snd_game_over, 10, false); room_goto(end_screen_room);}
if instance_exists(obj_text_box)
{exit;}
else {
/*switch current_state {

case"move_state.MOVE":
*/
movespeed = 1;
rightkey = keyboard_check(vk_right); //check the keyboard for a specific button being pressed, vk_right is a variable already set up by gamemaker, means right arrow key
//function checks if right arrow key is being pressed, 1 is yes, 0 if no
leftkey = keyboard_check(vk_left);
upkey = keyboard_check(vk_up);
downkey = keyboard_check(vk_down);

xspeed = (rightkey - leftkey) * movespeed; //value of right and left keys calculate the direction we're going
yspeed = (downkey - upkey) * movespeed;

//pause event
if instance_exists(obj_pause_object) //makes the player pause when it hits the object, helpful for transitions
{
	xspeed = 0;
	yspeed = 0;
	}

//set sprite
mask_index = sprite[DOWN]; //the mask on the down sprite will aply to all sprites
if yspeed == 0 
	{
		if xspeed > 0 {face = RIGHT};
		if xspeed < 0 {face = LEFT};
	};
if xspeed > 0 && face == LEFT {face = RIGHT}; //prevents moonwalking
if xspeed < 0 && face == RIGHT {face = LEFT};
if xspeed == 0
	{
		if yspeed > 0 {face = DOWN};
		if yspeed < 0 {face = UP};
	};
if yspeed > 0 && face == UP {face = DOWN};
if yspeed < 0 && face == DOWN{face = UP};	
sprite_index = sprite[face]

//collisions
if place_meeting(x + xspeed, y, obj_invisible_wall) == true //check player's position, and if there's a wall in the way stop them
	{
		xspeed = 0;
	}
if place_meeting(x, y + yspeed, obj_invisible_wall) == true //check player's position, and if there's a wall in the way stop them
	{
		yspeed = 0;
	}
	
x += xspeed; //+= is how to add something to a value x equals x plus x speed
y += yspeed;

//animate
if xspeed == 0 && yspeed == 0 
	{ image_index = 0; }
}
