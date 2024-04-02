depth = -9999;
//create the items with structs
//structs are like objects, and they have their own variables


//make an item constructor, which is a template
function create_item(_name, _desc, _spr) constructor //these are argument variables
{
	name = _name;//these are the actual variables
	description = _desc;
	sprite = _spr;
	
}
//to create a struct using a constructor:
// new_item = new create_item("Item Name", "this is the item description", spr_item); 

global.item_list = //this struct will contain all the items and their structs
{
	

rocket_piece: new create_item(

	"Rocket piece",
	//commas separate variables in structs
	"A piece of the rocket wing. Find all six!",
	spr_rocket_piece
	),

rocket_piece: new create_item(

	"Rocket piece",
	"A piece of the rocket wing. Find all six!",
	spr_rocket_piece
)
}
//create the inventory

inv = array_create(0);

selected_item = -1; //default value is nothing is selectd
//for drawing and mouse positions
sep = 16;
screen_bord = 16;