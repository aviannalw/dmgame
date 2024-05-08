if array_contains(inv, global.item_list.rocket_cone) || array_contains(inv, global.item_list.rocket_complete) && can_win = true
{ inst_64461DCD.image_index = 1;}



//get rid of tree message if have axe
if array_contains(inv, global.item_list.axe)
{ instance_deactivate_object(inst_400A9B92); instance_deactivate_object(inst_6C11F009); instance_deactivate_object(inst_7591C6BA); instance_deactivate_object(inst_6B9059F9);}

//game over conditions
//for testing purposes
if keyboard_check_pressed(ord("L")) {lives-=1;}
if lives <= 0 && !audio_is_playing(snd_game_over) 
{
	audio_play_sound(snd_game_over, 10, false); //play game over sound
	array_delete(inv, 0, 10); //delete player items
	obj_player_ram. x = 144; 
	obj_player_ram.y = 118;
	room_goto(end_screen_room);
	}




if instance_exists(obj_text_box)
{exit;}
else {
/*switch current_state {

case"move_state.MOVE": 
*/
movespeed = 1;
rightkey = keyboard_check(vk_right) || keyboard_check(ord("D"));//check the keyboard for a specific button being pressed, vk_right is a variable already set up by gamemaker, means right arrow key
//function checks if right arrow key is being pressed, 1 is yes, 0 if no
leftkey = keyboard_check(vk_left)|| keyboard_check(ord("A"));
upkey = keyboard_check(vk_up)|| keyboard_check(ord("W"));
downkey = keyboard_check(vk_down)|| keyboard_check(ord("S"));

xspeed = (rightkey - leftkey) * movespeed; //value of right and left keys calculate the direction we're going
yspeed = (downkey - upkey) * movespeed;

//pause event
if instance_exists(obj_pause_object) //makes the player pause when it hits the object, helpful for transitions
{
	xspeed = 0;
	yspeed = 0;
	}

//set sprite
mask_index = sprite[DOWN]; //the mask on the down sprite will apply to all sprites
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
