/*
if array_contains(inv, global.item_list.rocket_body) && obj_player_ram.has_piece_1 = true
{ 	var _seq = layer_sequence_create(sequences, obj_player_ram.x, obj_player_ram.y, seq_progress_1);
	layer_sequence_play(_seq);
	object_player_ram.has_piece_1 = false; //setting this back to false so that the cutscene doesn't trigger again
	}


