
function scr_game_text(_text_id){ //how to get different characters to say different things, could also be used for items?


talked_to_mechanic = false;
mechanic_count = 0;


talked_to_runner = false;
runner_count = 0;
inv = obj_item_manager.inv;

if obj_text_box.exists = false {

switch(_text_id) {
	case"NPC 1"://to make a new thing that talks, add a new case and put the id in the instance creation code in the room
		scr_text("Hi! I'm NPC 1");
		scr_text("I swear I have more things to say...");
		scr_text("just kidding");
			scr_option("yeah", "NPC 1 - yes"); //NPC 1 -yes is the name of the option, could be called anything
			scr_option("nah", "NPC 1 - no");
		break;
		case "NPC 1 - yes"://if this case/option was picked, then the following text
			scr_text("awesome, you picked yes!");
			break;
		case "NPC 1 - no":
			scr_text("aw, you picked no :(");
			break;
	
	
//--------------welcome message!!!-----------------//
	case"welcome message":
		scr_text("Hello, Player! Your PI has left their data management plan to you.");
		scr_text("Your mission, should you choose to accept it: build a rocket with all six parts.");
		scr_text("Collect the rocket blueprints to begin.");
		break;
		
//--------------LEVEL 1-----------------//	
	
	case"mechanic":
		scr_text("Hi! Your PI told me you might need some help with a rocket ship.");
		scr_text("Tell me about your data and I'll engrave one of these rocket bodies.");
		scr_text("What kind of data do you have?");
			scr_option("moon data", "mechanic - moon data")
			scr_option("space data", "mechanic - space data");
			scr_option("not sure", "mechanic - not sure");
		break;
		case"mechanic - moon data":
			lives -=1;
			scr_text("Are you sure about that?"); //I'd like to make this loop back around, not sure how yet
		
		break;
		case"mechanic - not sure":
			scr_text("Didn't your PI leave instructions?");
		break;
		case"mechanic - space data":
			scr_text("My favorite kind!");
			scr_text("How much space data do you have?");
				scr_option("A butt-ton!", "mechanic - butt-ton");
				scr_option("1 KB", "mechanic - kb");
				scr_option("6 TB", "mechanic - tb");
		break;
		case"mechanic - butt-ton":
			lives -=1;
			scr_text("Wow! Good luck with that! But I think that's too much for your rocket.");
		break;
		case"mechanic - kb":
			scr_text("Are you sure about that?");
		break;
		case"mechanic - tb":
			scr_text("That sounds about right.");
			scr_text("And what about sharing your 6 TB of space data?");
				scr_option("Share all of it.", "mechanic - all"); //there could be other options too
		break;
		case"mechanic - all":
			scr_text("Great.");
			scr_text("Anything else I need to know about your data?");
				scr_option("It's really weird.", "mechanic - weird");
				scr_option("The telescope.", "mechanic - telescope");
		break;
		case"mechanic - weird":
			scr_text("Huh...weird.");
		break;
		case"mechanic - telescope":
			scr_text("Thanks. That's really helpful.");
			scr_text("Well, let me get you settled. One second and I'll engrave this rocket body for you.");
			scr_text("Here you go!");
			if talked_to_mechanic = false && mechanic_count = 0 {
				instance_activate_object(inst_6D7DD6CC);
				talked_to_mechanic = true;
				mechanic_count ++;
				//get mechanic to move out of the way???
			}
		obj_speak_block.is_typing = false;//make mouse input work again
		break;
		
		case"mechanic thanks":
			scr_text("Thanks for coming! I'm sure you have more pieces to find...");
		break;
		
//--------------LEVEL 2-----------------//
		
		case"runner":
		scr_text("*pant* *pant* Oh, don't worry. I'm just resting.");
		scr_text("...");
		scr_text("......");
		scr_text("Say, aren't you working for that PI? I heard your project is really cool.");
		scr_option("It is.", "agree");
		break;
		
		case"agree":
		scr_text("Do you think you'll make your data public after you finish?");
		scr_option("That's the plan!", "plan agree");
		break;
		
		case"plan agree":
		scr_text("Hey, that's awesome.");
		scr_text("While you're here, can I look at your blueprints so I can also get to your data?");
		if !array_contains(inv, global.item_list.blueprint)
		{ scr_text("Hey wait a second...you don't have any blueprints.");
			scr_text("How are you supposed to build a rocket ship without them?");
			break;
		}
		scr_text("I think you might need this rocket piece...");
		scr_option("Take a Look.", "look");
		scr_option("No way!", "no way");
		break;
		
		case"look":
		scr_text("...");
		scr_text("...... :)");
		scr_text("I think I get it. Thanks for letting me catch my breath.");
		scr_text("You should grab that window.");
		if talked_to_runner = false && runner_count = 0 {
				instance_activate_object(inst_100EB070);
				talked_to_runner = true;
				runner_count ++;}
		break;
		
		
//--------------LEVEL 3-----------------//
		case"clue 1":
		scr_text("Clue 1: Data standards ensure the pieces of the plan work together, like bolts on a rocket ship.");
		scr_text("Find the next clue in the northern flower field");
		break;
		
		case"clue 2":
		scr_text("Which is not an example of data standards?");
		scr_option("How data are generated, processed, and documented.", "generated");
		scr_option("Common guidelines for data type(s).", "guidelines");
		scr_option("Limits on data storage.", "limits");
		break;
		
			case"generated":
			lives -=1;
			scr_text("Think again!");
			break;
			
			case"guidelines":
			lives -=1;
			scr_text("Nope!");
			break;
			
			case"limits":
			scr_text("That's correct!");
			scr_text("Find the next clue behind the lab");
			break;
		
		case"clue 3":
		scr_text("Sometimes there are no common standards for the type of data.");
		scr_text("In that case, document your work!");
		scr_text("now get cutting.");
		scr_text("I think I saw a rocket wing in the trees...");
		break;
		
		case"clue 4":
		scr_text("a ladder!");
		break;
		
//--------------LEVEL 4-----------------//	
		case"planet_1":
		scr_text("Name: Planet One         Storage: Up to 2 TB.");
		scr_text("Sensitivity: Accepts De-Identified Human Subject Data.         Cost: Free up to 2TB.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_1 selected");
		scr_option("No", "planet_1 unselected");
		break;
		
		case"planet_1 selected":
		scr_text("Your space data won't fit here! Try again.");
		break;
		
		case"planet_1 unselected":
		scr_text("You did not choose this planet.");
		break;
		
		case"planet_2":
		scr_text("Name: Planet Two         Storage: Up to 10 TB.");
		scr_text("Sensitivity: Not Suitable for Human Subject Data.         Cost: 1 Million Credits.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_2 selected");
		scr_option("No", "planet_2 unselected");
		break;
		
		case"planet_2 selected":
		scr_text("You don't have the budget for that!");
		break;
		
		case"planet_2 unselected":
		scr_text("You did not choose this planet.");
		break;
		
		case"planet_3":
		scr_text("Name: Planet Three       Storage: Up to 5PB.");
		scr_text("Sensitivity: Accepts All Data.                Cost: Free.");
		scr_text("Choose this repository planet?");
		scr_option("yes", "planet_3 selected");
		scr_option("No", "planet_3 unselected");
		break;
		
		case"planet_3 selected":
		scr_text("Great choice!");
		break;
		
		case"planet_3 unselected":
		scr_text("You did not choose this planet.");
		break;
		
		
		
//--------------LEVEL 5-----------------//	
		case"govguy":
		scr_text("What?");
		scr_text("What do you want? Is it rocket stuff?");
		scr_text("*sigh* It's more rocket stuff, isn't it?");
		break;
}
}
}
