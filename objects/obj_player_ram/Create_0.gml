xspeed = 0;
yspeed = 0;
movespeed = 1;

lives = 3;

sprite[RIGHT] = spr_ram_right; //an array has brackets, starts at 0 because RIGHT does and arrays start at 0
sprite[UP] = spr_ram_up;
sprite[LEFT] = spr_ram_left;
sprite[DOWN] = spr_ram_down;

face = DOWN; //how the player will face at the beginning

//this is circumventing the inventory system with the ladders
ladders = 0; // don't think i need this


has_piece_1 = false;

//hide the rocket body
instance_deactivate_object(inst_6D7DD6CC);
//hide the mechanic thanks
instance_deactivate_object(inst_232FC494);
//hide level 1 finish message
instance_deactivate_object(inst_5167C0DC);
//hide the axe
instance_deactivate_object(inst_1A4EB7F9);




//hide the window
instance_deactivate_object(inst_100EB070);
// hide the runner thanks
instance_deactivate_object(inst_4D02E439);
//hide level 2 finish message
instance_deactivate_object(inst_68E30323);


//hide the engine
instance_deactivate_object(inst_7EC8DACA);
// hide the collect message
instance_deactivate_object(inst_6D688131);

//disable the bridge
instance_activate_object(inst_6202ED68);
instance_activate_object(inst_42635F0F);

//hide the second ladder
instance_deactivate_object(inst_6DE0E3D7);
//hide the restriction papers
instance_deactivate_object(inst_45D413FD);
//hide rpapers guy
instance_deactivate_object(inst_78CF365B);
//hide the license agreement
instance_deactivate_object(inst_612FC217);
//hide lpapers guy
instance_deactivate_object(inst_47946D97);
//hide the right rocket wing
instance_deactivate_object(inst_48F45D68);

inv = obj_item_manager.inv;
