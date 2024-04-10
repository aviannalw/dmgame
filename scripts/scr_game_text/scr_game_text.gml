
function scr_game_text(_text_id){ //how to get different characters to say different things, could also be used for items?

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
	
	
	case"mechanic":
		scr_text("Hi! Your PI told me you might need some help with a rocket ship.");
		scr_text("Tell me about your data and I'll engrave one of these rocket bodies.");
		scr_text("What kind of data do you have?");
			scr_option("moon data", "mechanic - moon data");
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
		break;
		
}

}