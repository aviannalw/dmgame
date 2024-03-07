 if place_meeting(x, y, bigram_object) && !instance_exists(obj_warp) //if the player runs into th warp block and this instance does not eist, then run this code
	{
	var inst = instance_create_depth(0, 0, -9999, obj_warp); //inst is a local variable, we only need it for this step event
	inst.target_x = target_x;
 	inst.target_y = target_y;
	inst.target_rm = target_rm;
	inst.target_face = target_face; 
	};
