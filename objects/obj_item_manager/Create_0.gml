depth = -9999;
//create the items with structs
//structs are like objects, and they have their own variables
has_pi_paper = false;
has_blueprint = false;
selected = false;
//make an item constructor, which is a template
function create_item(_name, _desc, _spr, _candrop, _effect) constructor //these are argument variables
{
	name = _name;//these are the actual variables
	description = _desc;
	sprite = _spr;
	can_drop = _candrop; //a variable that tells us whether or not you can drop it; is it a key item?
	effect = _effect;
	
}
//to create a struct using a constructor:
// new_item = new create_item("Item Name", "this is the item description", spr_item); 

global.item_list = //this struct will contain all the items and their structs
{
	

rocket_body: new create_item(

	"Rocket Body",
	//commas separate variables in structs
	"The Rocket Body. Click to combine!",
	spr_rocket_body,
	false,
	
	//this function is specific to this item, it's the effect the item has
	
	function ()
		{
				//i give up on cutscenes 
				/* if obj_player_ram.has_clicked_rb = false
				{var _layer = "sequences";
				var _seq = layer_sequence_create(_layer, obj_player_ram.x, obj_player_ram.y, seq_progress_1);
		
					layer_sequence_play(_seq);
					layer_sequence_destroy(_seq);
					obj_player_ram.has_clicked_rb = true;
				}
				*/
	
	
			if array_contains(inv, global.item_list.rocket_window)
			//inv selected item equals rocket body and rocket window exists in inventory, then "combine" the objects into the new sprite
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_body_window); // "combines" the objects visually, replaces it with the new sprite
			array_delete(inv, array_get_index(inv, global.item_list.rocket_window), 1);
			}
		}	 
	
	),

rocket_window: new create_item(
		"Rocket Window",
		"The Rocket Window. Click to combine!",
		spr_rocket_window,
		false,
		function ()
		{
			if array_contains(inv, global.item_list.rocket_body)
			
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_body_window);
			array_delete(inv, array_get_index(inv, global.item_list.rocket_body), 1);
			}
		}
		
		),
	
	
rocket_body_window: new create_item(
		
		"Partial Rocket: 2/6",
		"The Rocket Body and Window.",
		spr_rocket_body_window,
		false,
		function () {}
		),	
		
rocket_left_wing: new create_item(
		
		"Rocket Wing",
		"The Left Wing of the Rocket. Click to Combine!",
		spr_rocket_wing,
		false,
		function () 
		{
			if array_contains(inv, global.item_list.rocket_body_window)
			
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_body_window_wing);
			array_delete(inv, array_get_index(inv, global.item_list.rocket_body_window), 1);
			}
		}
		),	
	
rocket_body_window_wing: new create_item(
		
		"Partial Rocket: 3/6",
		"The Half-Completed Rocket.",
		spr_rocket_body_window_wing,
		false,
		function () {}
		),	
		
rocket_engine: new create_item(
		
		"Rocket Thruster",
		"The Rocket Thruster. Click to Combine!",
		spr_rocket_engine,
		false,
		function () 
		{
			if array_contains(inv, global.item_list.rocket_body_window_wing)
			
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_body_window_wing_engine);
			array_delete(inv, array_get_index(inv, global.item_list.rocket_body_window_wing), 1);
			}
		}
		),	
		
		
rocket_body_window_wing_engine: new create_item(
		
		"Partial Rocket: 4/6.",
		"Most of a Rocket.",
		spr_rocket_body_window_wing_engine,
		false,
		function () {}
		),	
		
		
rocket_right_wing: new create_item(
		
		"Rocket Wing",
		"The Right Wing of the Rocket. Click to Combine!",
		spr_rocket_wing,
		false,
		function () 
		{
			if array_contains(inv, global.item_list.rocket_body_window_wing_engine)
			
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_body_window_wing_engine_wing);
			array_delete(inv, array_get_index(inv, global.item_list.rocket_body_window_wing_engine), 1);
			}
		}
		),	
		
rocket_body_window_wing_engine_wing: new create_item(
		
		"Most of a Rocket: 5/6.",
		"Almost all of a Rocket!",
		spr_rocket_body_window_wing_engine_wing,
		false,
		function () {}
		),	

rocket_cone: new create_item(
		
		"Rocket Cone",
		"The Rocket Cone. Click to Combine!",
		spr_rocket_cone,
		false,
		function () 
		{
			if array_contains(inv, global.item_list.rocket_body_window_wing_engine_wing)
			
			{
			array_delete(inv, selected_item, 1);
			score +=10;
			audio_play_sound(snd_item_get, 8, false);
			array_insert(inv, selected_item, global.item_list.rocket_complete);
			array_delete(inv, array_get_index(inv, global.item_list.rocket_body_window_wing_engine_wing), 1);
			}
		}
		),	
		
rocket_complete: new create_item(
		
		"Completed Rocket: 6/6",
		"The Completed Rocket!",
		spr_rocket_complete,
		false,
		function () {}
		),	


ladder: new create_item(

	"Ladder",
	"Used to climb cliffs.",
	spr_ladder_piece,
	false, //cannot drop this item
	function ()
	{

		
		var _used = false; //makes it a single-use item
		if instance_exists(obj_ivy_wall_block) //check to see if there are any of these in the room
			{
				with(obj_ivy_wall_block) //okay if there are, if the player is within 10 px, then the object destroys itself
				{
					if distance_to_object(obj_player_ram) < 10 
					{
						instance_destroy();
						_used = true;
						score +=10;
					}
				}
			}
			//get rid of the ladder in the inv
			if _used ==true
			{array_delete(inv, selected_item, 1);}
	}
			
	
),


axe: new create_item(

		"Axe",
		"Used to cut trees.",
		spr_axe,
		false,
		function ()
		{
			if instance_exists(obj_tree_break) //check to see if there are any of these in the room
				{
					with(obj_tree_break) //okay if there are, if the player is within 10 px, then the object destroys itself
					{
						if distance_to_object(obj_player_ram) < 10 
						{
						instance_destroy();
						}
					}
				}
		}
),

pi_paper: new create_item(
		
		"PI Paper",
		"Looks like your PI left instructions...",
		spr_pi_paper,
		false,
		function () {has_pi_paper = true;}

),
blueprint: new create_item(
		
		"Rocket Blueprints",
		"View Progress",
		spr_blueprint,
		false,
		function () {has_blueprint = true;}
			
//this is where you add a functionality to the blueprints

)
/*,
info_pickup: new create_item(
		
		"",
		"",
		spr_info,
		true,
		function ()
		{
		}
)*/
}
//create the inventory

inv = array_create(0);
inv_max = 10;
selected_item = -1; //default value is nothing is selectd
//for drawing and mouse positions
sep = 16;
screen_bord = 16;