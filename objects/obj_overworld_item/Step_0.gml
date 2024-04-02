///if the player runs into this, it gets added to the inventory

sprite_index = item.sprite; //means the sprite will match the one specified in the create event, can change per instance

if place_meeting(x, y, obj_player_ram)
{
	//add item to inventory
	item_add(item);
	instance_destroy();
}