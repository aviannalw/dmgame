//picking up items

function item_add(_item) //item is the argument that we need
{
	score +=10;
	var _added = false;
	if array_length(obj_item_manager.inv) < obj_item_manager.inv_max //limit the items in the inventory
	{
	array_push(obj_item_manager.inv, _item) //where we put the item and what to put in the inv
	_added = true;
	audio_play_sound(snd_item_get, 8, false);
	}
	
	return _added;
}

