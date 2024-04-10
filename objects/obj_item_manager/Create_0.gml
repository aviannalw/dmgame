depth = -9999;
//create the items with structs
//structs are like objects, and they have their own variables


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
	

rocket_piece: new create_item(

	"Rocket piece",
	//commas separate variables in structs
	"A piece of the rocket wing. Find all six!",
	spr_rocket_piece,
	true,
	
	//this function is specific to this item, it's the effect the item has
	function()
		{
				//obj_player_ram.score +=10; //increases the player's total score by 10 points
				//create an if statement here to delete the item once all six rocket pieces have been collected to turn ino the third part
				array_delete (inv, selected_item, 1)
				//coud be also used with the ladder item
		}
	
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
				
	
)
}
//create the inventory

inv = array_create(0);
inv_max = 6;
selected_item = -1; //default value is nothing is selectd
//for drawing and mouse positions
sep = 16;
screen_bord = 16;