//make sprite fade when player goes behind it
if collision_rectangle(104, 51, 236, 97, obj_player_ram, true, true)
{image_alpha = .4;} else image_alpha = 1;