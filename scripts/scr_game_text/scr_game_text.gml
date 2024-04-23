
function scr_game_text(_text_id){ //how to get different characters to say different things, could also be used for items?

//hide the rocket body
instance_deactivate_object(inst_6D7DD6CC);
talked_to_mechanic = false;
mechanic_count = 0;


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
		break;
		
		case"mechanic thanks":
			scr_text("Thanks for coming! I'm sure you have more pieces to find...");
		break;
		
//--------------LEVEL 2-----------------//
		case"researcher":
		scr_text("hey, can I look at your blueprints?");
		break;
		
		
		
//--------------LEVEL 3-----------------//
		case"rp1":
		scr_text("1/6: important information.");
		scr_text("find the next piece in the northern flower field");
		break;
		
		case"rp2":
		scr_text("2/6: more info girlipop.");
		scr_text("are you writing this down?");
		scr_text("find the next piece behind the lab");
		break;
		
		case"rp3":
		scr_text("3/6: aw, you found me. anyway you need to know that...");
		scr_text("and this too...");
		scr_text("find the next piece on the southwest beach");
		break;
		
		case"rp4":
		scr_text("4/6: a really good fact.");
		scr_text("find the next piece in the trees, maybe add an axe to the inventory to cut down a specific tree");
		break;
		
		case"rp5":
		scr_text("5/6: more info, hooray");
		scr_text("find the last piece between the cliffs/with the guy on the beach");
		break;
		
		case"rp6":
		scr_text("6/6: last piece of info...");
		scr_text("you did it! let's add the wing to your inventory!");
		scr_text("go up the cliffs to the telescope");
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
