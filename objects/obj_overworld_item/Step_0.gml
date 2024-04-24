///if the player runs into this, it gets added to the inventory

sprite_index = item.sprite; //means the sprite will match the one specified in the create event, can change per instance

if place_meeting(x, y, obj_player_ram)
{ 
	//add item to inventory
	if item_add(item) == true {instance_destroy();}//this code looks at the _added variable, means you can't pickup more than the inv max
}
//i don't think this code is relavant in the end; doesn't seem to do anything