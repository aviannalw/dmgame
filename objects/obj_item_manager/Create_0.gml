depth = -9999;
//create the items with structs
//structs are like objects, and they have their own variables
has_pi_paper = false;

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
	"The Rocket Body. Collect all six rocket pieces!",
	spr_rocket_body,
	false,
	
	//this function is specific to this item, it's the effect the item has
	
				//coud be also used with the ladder item
				
	
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
					}
				}
			}
			//get rid of the ladder in the inv
			if _used ==true
			{array_delete(inv, selected_item, 1);}
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
		function () {}
			
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
inv_max = 6;
selected_item = -1; //default value is nothing is selectd
//for drawing and mouse positions
sep = 16;
screen_bord = 16;