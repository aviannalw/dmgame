xspeed = 0;
yspeed = 0;
movespeed = 1;

sprite[RIGHT] = spr_ram_right; //an array has brackets, starts at 0 because RIGHT does and arrays start at 0
sprite[UP] = spr_ram_up;
sprite[LEFT] = spr_ram_left;
sprite[DOWN] = spr_ram_down;

face = DOWN; //how the player will face at the beginning

//this is circumventing the inventory system with the ladders
ladders = 0;